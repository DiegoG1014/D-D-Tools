camera = {
  
  curr     = {win.w/2,win.h/2,0,0},
  
  goal     = {win.w/2,win.h/2,0,0},
  
  limit    = {{1000,800,360,2},{-280,-300,0,-2}},
  
  drawList = {{},{},{},{},{}},
  
  fxList   = {
    A = {{},{},{},{},{}},
    C = {{},{},{},{},{}}
  },
  
  guiList  = {{},{},{},{},{}}
  
}

camerapast = {}

local normal = function(d,x,y,r,sx,sy,ox,oy)
  
  local cx,cy,cr,czo = unpack(camera.curr)
  local imw,imh = d:getDimensions()
  ox = ox or imw/2
  oy = oy or imh/2
  
  x,y,r,sx,sy = x+cx,y+cy,r+cr,sx,sy
  lg.draw( d , x,y,r,sx,sy,ox,oy )
  
end

local effect = function(d)
  
  d(unpack(camera.curr))
  
end

local quad = function(d,x,y,r,sx,sy,ox,oy)
  
  local cx,cy,cr,czo = unpack(camera.curr)
  
  local img,quad = unpack(d)
  local _,_,imw,imh = quad:getViewport()
  ox = ox or imw/2
  oy = oy or imh/2
  x,y,r,sx,sy = x+cx,y+cy,r+cr,sx,sy
  lg.draw( img,quad , x,y,r,sx,sy,ox,oy )
  
end

local drawtypes = {
  
  image       = normal,
  texture     = quad,
  canvas      = normal,
  spriteBatch = normal,
  fx          = effect
  
}

lg.setScissor(0,0,conf.window.width,conf.window.height)

local function clear()
  
  camerapast.drawList = camera.drawList
  camera.drawList = {{},{},{},{},{}}
  
  camerapast.fxList = camera.fxList
  camera.fxList   = {
    A = {{},{},{},{},{}},
    C = {{},{},{},{},{}}
  }
  
  camerapast.guiList = camera.guiList
  camera.guiList  = {{},{},{},{},{}}
  
end

function camera.draw(d,x,y,r,sx,sy, drawtype, priority, color , ox,oy)
  
  if type(drawtype) == "number" and not priority then drawtype,priority = nil,drawtype end
  
  priority = math.floor(priority)
  if priority < 1 then priority = 1
  elseif priority > 5 then priority = 5
  end
  
  if not color then color = {255,255,255,255} end
  
  table.insert(camera.drawList[priority], {d,x,y,r,sx,sy,ox,oy,type=drawtype,color = color})
  
end

function camera.gui(drawFunc, priority)
  
  priority = math.floor(priority)
  if priority < 1 then priority = 1
  elseif priority > 5 then priority = 5
  end
  
  table.insert(camera.guiList[priority],drawFunc)
  
end

function camera.fx(drawFunc, priority, type)
  
  priority = math.floor(priority)
  if priority < 1 then priority = 1
  elseif priority > 5 then priority = 5
  end
  
  assert((type == "A") or (type == "B") or (type == "C"), "Camera", "Effect type must be A, C or B, case-sensitive")
  
  if type == "B" then
    table.insert(camera.drawList[priority],{drawFunc,0,0,0,0,0,0,0,type="fx",color = {255,255,255,255}})
  else
    table.insert(camera.fxList[type][priority],drawFunc)
  end
  
end

function love.draw()
  
  local sw,sh = conf.window.width,conf.window.height
  
  local cx,cy,cr,czo = unpack(camera.curr)
  
  local drawCount,guiCount,fx,fxA,fxB,fxC = 0,0,0,0,0,0
  
  local ax,ay = win.w/2,win.h/2
  
  --lg.translate(ax,ay)
  lg.scale(czo+1,czo+1)
  
  for i,v in ipairs(camera.fxList.A) do
    
    lg.setColor(255,255,255,255)
    assets.font()
    
    for i1 in pairs(v) do
      
      camera.fxList.A[i][i1](unpack(camera.curr))
      fxA = fxA + 1
      fx  = fx  + 1
      
    end
    
  end
  
  for i,v in ipairs(camera.drawList) do
    
    lg.setColor(255,255,255,255)
    assets.font()
    
    for i1,v1 in ipairs(v) do
      
      lg.setColor(v1.color)
      drawtypes[v1.type](unpack(v1))
      
      drawCount = drawCount + 1
      
    end
    
    drawCount = drawCount + 1
    
  end
  
  for i,v in ipairs(camera.fxList.C) do
    
    lg.setColor(255,255,255,255)
    assets.font()
    
    for i1 in pairs(v) do
      
      camera.fxList.C[i][i1](unpack(camera.curr))
      fxC = fxC + 1
      fx  = fx  + 1
      
    end
    
  end
  
  --lg.translate(-ax,-ay)
  lg.origin()
  
  lg.setColor(255,255,255,255)
  
  for i,v in ipairs(camera.guiList) do
    
    lg.setColor(255,255,255,255)
    assets.font()
    
    for i1 in pairs(camera.guiList[i]) do
      
      camera.guiList[i][i1]()
      guiCount = guiCount + 1
      
    end
    
  end
  
  clear()
  
  log.subrecord("Camera",("Drew %d objects, %d GUI elements, and %d effects (%d A - %d B"):format(drawCount,guiCount,fx,fxA,fxB))
  
end

function camera.move(x,y,zo,r)
  
  local a = {x,y,zo,r}
  
  for i,v in ipairs(camera.goal) do
    camera.goal[i] = v + a[i]
  end
  
  for i,v in ipairs(camera.goal) do
    if v > camera.limit[1][i] then
      camera.goal[i] = camera.limit[1][i]
    elseif v < camera.limit[2][i] then
      camera.goal[i] = camera.limit[2][i]
    end
  end
  
end

function camera.set(x,y,zo,r)
  
  camera.goal = {x,y,zo,r}
  
  for i,v in ipairs(camera.goal) do
    if v > camera.limit[1][i] then
      camera.goal[i] = camera.limit[1][i]
    elseif v < camera.limit[2][i] then
      camera.goal[i] = camera.limit[2][i]
    end
  end
  
end

function camera.setLimit(ax,ay,azo,ar , bx,by,bzo,br)
  
  camera.limit = {{ax,ay,azo,ar},{bx,by,bzo,br}}
  
end

local function update(dt)
  
  local cx,cy,cz,cr = tonumber(unpack(camera.curr))
  local gx,gy,gz,gr = tonumber(unpack(camera.goal))
  
  cx = cx - ( ( ( cx - gx ) ) * 10 * dt )
  
  cy = cy - ( ( ( cy - gy ) ) * 10 * dt )
  
  cz = cz - ( ( ( cz - gz ) ) * dt )
  
  cr = cr - ( ( ( cr - gr ) ) * 10  * dt )
  
  
  camera.curr  = {cx,cy,cz,cr}
  
end

love.addtl("update","camera",update)