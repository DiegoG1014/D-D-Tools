assets = {
  
  dirs = {
    
    image = "resources/assets/images/",
    font = "resources/assets/fonts/",
    sound = "resources/assets/sounds/",
    texture = "resources/assets/textures/",
    particle = "resources/assets/particles/"
    
  },
  
  loaded = {
    
    image = {},--setmetatable({},{__mode = "v"}),
    font = {default = {}},
    sound = {},--setmetatable({},{__mode = "v"}),
    texture = {},--setmetatable({},{__mode = "v"}),
    canvas = {},--setmetatable({},{__mode = "v"}),
    spriteBatch = {},--setmetatable({},{__mode = "v"})
    animation = {},--setmetatable({},{__mode = "v"})
    
  }
  
}

--All of the functions here work the following way:
--If it's loaded it simply returns it, and if it isn't it loads it and then returns it.
--Loaded assets are stored locally in a weak table, meaning that they will be deleted as soon as they are no longer being used

function assets.image(name)
  
  if assets.loaded.image[name] then
    
    log.subrecord("Assets",("Returned image %s"):format(name))
    return assets.loaded.image[name]
    
  else
    
    assets.loaded.image[name] = {}
    local img = lg.newImage(string.format("%s%s.png",assets.dirs.image,name))
    assets.loaded.image[name] = img
    
    log.record("Asset Manager","Loaded image asset: "..name)
    
    return img
    
  end
  
end

function assets.font(name,size)
  
  if type(name) == "table" then
    name,size = unpack(name)
  end
  size = size or 16
  name = name or "default"
  
  if name == "default" then
    
    local fnt = assets.loaded.font.default[size]
    if fnt then lg.setFont(fnt) else assets.loaded.font.default[size] = lg.newFont(size); lg.setFont(assets.loaded.font.default[size]) end
    return
    
  end
  
  if not assets.loaded.font[name] then assets.loaded.font[name] = {} end
  
  if assets.loaded.font[name][size] then
    
    log.subrecord("Assets",("Set font %s"):format(name))
    lg.setFont(assets.loaded.font[name][size])
    
  else
    
    local fntloc = string.format("%s%s.ttf",assets.dirs.font,name)
    assets.loaded.font[name][size] = lg.newFont(fntloc,size)
    
    log.record("Asset Manager","Loaded font asset: "..name)
    lg.setFont(assets.loaded.font[name][size])
    
  end
  
end

function assets.texture(name,sprite,data) --A texture returns the image and the queried quad. [Quad Wiki Page](https://love2d.org/wiki/Quad)
  
  if type(name) == "table" then
    name,sprite,data = unpack(name)
  end
  --Every *single* texture (or atlas) MUST have a '.sprite' file with the same name that specifies it's quad dimensions and the name of each sprite
  
  if assets.loaded.texture[name] then
    
    log.subrecord("Assets",("Returned texture %s"):format(name))
    return assets.loaded.texture[name].img, assets.loaded.texture[name].sprites[sprite], #assets.loaded.texture[name].sprites
    
  else
    
    assets.loaded.texture[name] = {}
    local spriteinfo = data or lf.load(string.format("%s%s.sprite",assets.dirs.texture,name))()
    assets.loaded.texture[name].img = lg.newImage(string.format("%s%s.png",assets.dirs.texture,name))
    local w,h = assets.loaded.texture[name].img:getDimensions()
    assets.loaded.texture[name].sprites = {}
    for i,v in pairs(spriteinfo) do
      
      local x, y  = unpack(v.pos)
      local ws,hs = unpack(v.dim)
      assets.loaded.texture[name].sprites[i] = lg.newQuad(x,y,ws,hs,w,h)
      
    end
    
    log.record("Asset Manager","Loaded texture asset: "..name)
    
    return assets.loaded.texture[name].img, assets.loaded.texture[name].sprites[sprite], #assets.loaded.texture[name].sprites
    
  end
  
end

function assets.canvas(name, data) --Basically this is a regular image just that it's actually a bunch of them merged into a single image (Images used to draw it can then be discarded) [Canvas Wiki Page](https://love2d.org/wiki/Canvas)
  
  if type(name) == "table" then
    name,data = unpack(name)
  end
  if assets.loaded.canvas[name] then
    
    log.subrecord("Assets",("Returned canvas %s"):format(name))
    return assets.loaded.canvas[name]
    
  else
    
    local canvas = lg.newCanvas(unpack(data[1]))
    local prevCanvas = lg.getCanvas()
    lg.setCanvas(canvas)
    
    local success = pcall(data[2])
    if not success then canvas = nil; lg.setCanvas(prevCanvas); return success end
    
    lg.setCanvas(prevCanvas)
    
    assets.loaded.canvas[name] = canvas
    return assets.loaded.canvas[name]
    
  end
  
end

function assets.spriteBatch(name, quad, amount, size) --Amount = {x,y}; quad and timeout are simultaneously optional
  
  if type(name) == "table" then
    name,quad,amount,size = unpack(name)
  end
  if quad and (not amount or not size) then
    quad,amount,size = nil,quad,amount
  end
  
  if assets.loaded.spriteBatch[name] then
    
    log.subrecord("Assets",("Returned batch %s"):format(name))
    return assets.loaded.spriteBatch[name]
    
  else
    
    assets.loaded.spriteBatch[name] = {}
    
    local max = amount[1] * amount[2]
    
    if quad then
      
      local a,b = assets.texture(name,quad,2/60)
      local spriteBatch = lg.newSpriteBatch(a,max,"static")
      local x, y, w, h = b:getViewport()
      
      if size and type(size) == "table" then
        w,h = unpack(size)
      end
      
      local ind = 1
      
      while ind <= amount[1] do
        
        spriteBatch:add(b,(w*ind)-w,0)
        ind = ind+1
        
      end
      
      ind = 1
      
      while ind <= amount[2] do
        
        spriteBatch:add(b,0,(h*ind)-h)
        ind = ind+1
        
      end
      
      assets.loaded.spriteBatch[name] = spriteBatch
      return assets.loaded.spriteBatch[name]
      
    else
      
      local a = assets.image(name,2/60)
      local spriteBatch = lg.newSpriteBatch(a,max,"static")
      
      local w,h
      
      if size and type(size) == "table" then
        w,h = unpack(size)
      else
        w,h = a:getDimensions()
      end
      
      local ind = 0
      
      while ind <= amount[1] do
        
        spriteBatch:add((w*ind),0)
        ind = ind+1
        
      end
      
      ind = 0
      
      while ind <= amount[2] do
        
        spriteBatch:add(0,(h*ind))
        ind = ind+1
        
      end
      
      spriteBatch:flush()
      assets.loaded.spriteBatch[name] = spriteBatch
      return assets.loaded.spriteBatch[name]
      
    end
    
  end
  
end

function assets.particle(name) --This uses .particle reference files; ALL particle images MUST be in some atlas or another
  
  local data = lf.load(string.format("%s%s.sprite",assets.dirs.particle,name))()
  local image = lg.newImage(string.format("%s%s.png",assets.dirs.particle,name))
  local psystem = lg.newParticleSystem(image,data.buffer)
  local quads = {}
  for i,v in ipairs(data.quads) do
    table.insert(quads,lg.newQuad(unpack(v),image:getDimensions()))
  end
  psystem:setQuads              (unpack(quads))
  psystem:setSpin               (unpack(data.spin))
  psystem:setSpread             (data.spread)
  psystem:setColors             (unpack(data.colors))
	psystem:setParticleLifetime   (unpack(data.life))
	psystem:setEmissionRate       (data.rate)
	psystem:setSizeVariation      (data.size)
	psystem:setLinearAcceleration (unpack(data.movement))
  
  log.record("Assets",("Created particle object: %s"):format(name))
  
  return psystem
  
end

function assets.animation(name,data)
  
  if type(name) == "table" then
    name,data = unpack(name)
  end
  if assets.loaded.animation[name] then
    
    log.subrecord("Assets",("Returned animation %s"):format(name))
    return assets.loaded.animation[name]
    
  else
    
    local animObj = {}
    if not data then animObj = lf.load(("%s%s.anim"):format(assets.dirs.animation,name))() else animObj = data end
    animObj.framerate  = animObj.framerate or log.record("Assets",("Incomplete data for %s, framerate "):format(name),true,2)
    animObj.texture = animObj.texture or log.record("Assets",("Incomplete data for %s, texture"):format(name),true,2)
    
    animObj.__framerate = tonumber(animObj.framerate)
    animObj.stage = 1
    
    if type(animObj.texture) == "table" then
      local dat = animObj.texture
      animObj.texture = {name = name}
      animObj.texture.ref,_,animObj.sprites = assets.texture(name,1,dat)
    else
      local dat = animObj.texture
      animObj.texture = {name = dat}
      animObj.texture.ref,_,animObj.sprites = assets.texture(dat,1)
    end
    
    function animObj:update(dt)
      self.framerate = self.framerate - dt
      if self.framerate <= 0 then
        self.stage = self.stage + 1
        self.framerate = self.__framerate
      end
      
      if self.stage > self.sprites then
        self.stage = 1
      end
    end
    
    function animObj:draw(x,y,r,sx,sy,p,c)
      
      local img,quad = assets.texture(self:getStage())
      camera.draw({img,quad},x,y,r,sx,sy, "texture", p,c)
      
    end
    
    function animObj:getTexture()
      return self.texture.ref, self.texture.name
    end
    
    function animObj:getStage()
      return self.texture.name,self.stage
    end
    
    return animObj
    
  end
  
end
