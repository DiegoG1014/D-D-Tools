local menu = {}
local dir = "resources/menu/"

local widgetHandler = {
  
  draw = {
    
    button = function(widget,layout,targetx,targety)
      
      local dw,dh = unpack(layout.size.button)
      local  w, h = unpack(widget.size)
      local  x, y = unpack(widget.pos )
      if not w then w = dw end
      if not h then h = dh end
      x,y = x+targetx,y+targety
      
      lg.setColor(widget.border.color[widget.state])
      lg.rectangle("fill", x-widget.border[1],y-widget.border[1],(widget.border[1]*2)+w,(widget.border[1]*2)+h)
      
      lg.setColor(widget.color[widget.state])
      lg.rectangle("fill", x,y,w,h)
      
      if widget.texture then
        lg.setColor(widget.texture.color[widget.state])
        local img = assets.image(widget.texture[1])
        local iw,ih = img:getDimensions()
        lg.draw(img, x,y,0,math.resize(iw,ih,w,h))
      end
      
      lg.setColor(widget.font.color[widget.state])
      
      assets.font(widget.font[1],widget.font[2])
      
      if not widget.text[4] and type(widget.text[3]) == "table" then
        widget.text[4] = widget.text[3]
        widget.text[3] = "top"
      end --Makes sure there's a second alignment value
      
      local tx,ty = x+widget.text[4][1],y+widget.text[4][2] --Positions text
      if widget.text[3] == "center" then
        lg.printf(widget.text[1],tx,(ty+(h/2)-widget.font[2]),w,widget.text[2])
      elseif widget.text[3] == "top" then
        lg.printf(widget.text[1],tx,(ty-widget.font[2]),w,widget.text[2])
      elseif widget.text[3] == "bottom" then
        lg.printf(widget.text[1],tx,(ty+h-widget.font[2]),w,widget.text[2])
      end --Draws text
      
      if widget.icon then
        lg.setColor(255,255,255)
        local img,bx,by,w,h = unpack(widget.icon)
        img = assets.image(img)
        local ix,iy = img:getDimensions()
        lg.draw(img,(x+bx),(y+by),0,math.resize(ix,iy,w,h))
      end
      
    end,
    
    slider = function(widget,layout,targetx,targety)
      
      local dw,dh = unpack(layout.size.slider)
      local  w, h = unpack(widget.size)
      local  x, y = unpack(widget.pos )
      if not w then w = dw end
      if not h then h = dh end
      if widget.vertical then
        w,h = h,w
      end
      x,y = x+targetx,y+targety
      
      lg.setColor(widget.border.color[widget.state])
      lg.rectangle("fill", (x-widget.border[1]),(y-widget.border[1]),(widget.border[1]*2)+w,(widget.border[1]*2)+h)
      
      lg.setColor(widget.color[widget.state])
      lg.rectangle("fill", x,y,w,h)
      
      if widget.texture then
        lg.setColor(widget.texture.color[widget.state])
        local img = {assets[widget.texture[2]](unpack(widget.texture[1]))}
        lg.draw(img, x,y,0,math.resize(img[1]:getDimensions(),w,h))
      end
      
      lg.setColor(widget.font.color[widget.state])
      
      assets.font(widget.font[1],widget.font[2])
      
      if not widget.text[4] and type(widget.text[3]) == "table" then
        widget.text[4] = widget.text[3]
        widget.text[3] = "top"
      end
      
      local currentval
      if widget.values[3] then
        
        currentval = ":"..math.floor(math.percentageOf(widget.baseval,widget.values[2])).."%"
        
      else
        
        currentval = widget.values[2]
        
      end
      
      local tx,ty = x+widget.text[4][1],y+widget.text[4][2]
      if widget.text[3] == "center" then
        lg.printf(widget.text[1]..currentval,x,(5+(h/2)-widget.font[2]),w,widget.text[2])
      elseif widget.text[3] == "top" then
        lg.printf(widget.text[1]..currentval,x,y+targety,w,widget.text[2])
      elseif widget.text[3] == "bottom" then
        lg.printf(widget.text[1]..currentval,x,(y+h-widget.font[2]),w,widget.text[2])
      end
      
      if widget.icon then
        lg.setColor(255,255,255)
        local img,bx,by,w,h = unpack(widget.icon)
        img = assets.image(img)
        local ix,iy = img:getDimensions()
        lg.draw(img,(x+bx),(y+by),0,math.resize(ix,iy,w,h))
      end
      
      if widget.vertical then --Bar
        
        local percOf = math.percentageOf
        local perc   = math.percent
        local bx = x-(widget.bar[2]/4)
        local by = (perc(percOf(widget.baseval,widget.values[2]),h))+y
        lg.setColor(widget.bar.color)
        lg.rectangle("fill",bx,by,widget.bar[2],widget.bar[1])
        
      else
        
        local percOf = math.percentageOf
        local perc   = math.percent
        local bx = (perc(percOf(widget.baseval,widget.values[2]),w))+x
        local by = (widget.bar[2])+y/2
        lg.setColor(widget.bar.color)
        lg.rectangle("fill",bx,by,widget.bar[1],widget.bar[2])
        
      end
      
    end,
    
    panel = function(widget,layout,targetx,targety)
      
      local dw,dh = unpack(layout.size.button)
      local  w, h = unpack(widget.size)
      local  x, y = unpack(widget.pos )
      if not w then w = dw end
      if not h then h = dh end
      x,y = x+targetx,y+targety
      
      lg.setColor(widget.border.color)
      lg.rectangle("fill", (x-widget.border[1]),(y-widget.border[1]),(widget.border[1]*2)+w,(widget.border[1]*2)+h)
      
      lg.setColor(widget.color)
      lg.rectangle("fill", x,y,w,h)
      
      if widget.texture then
        lg.setColor(widget.texture.color[widget.state])
        local img = {assets[widget.texture[2]](unpack(widget.texture[1]))}
        lg.draw(img, x,y,0,math.resize(img[1]:getDimensions(),w,h))
      end
      
      lg.setColor(widget.font.color)
      
      assets.font(widget.font[1],widget.font[2])
      
      if not widget.text[4] and type(widget.text[3]) == "table" then
        widget.text[4] = widget.text[3]
        widget.text[3] = "top"
      end --Makes sure there's a second alignment value
      
      local tx,ty = x+widget.text[4][1],y+widget.text[4][2] --Positions text
      if widget.text[3] == "center" then
        lg.printf(widget.text[1],tx,(ty+(h/2)-widget.font[2]),w,widget.text[2])
      elseif widget.text[3] == "top" then
        lg.printf(widget.text[1],tx,(ty-widget.font[2]),w,widget.text[2])
      elseif widget.text[3] == "bottom" then
        lg.printf(widget.text[1],tx,(ty+h-widget.font[2]),w,widget.text[2])
      end --Draws text
      
    end
    
  },
  
  update = {
    
    button = function(widget,layout,targetx,targety)
      
      local x,y,w,h = unpack(widget.pos)
      w,h = unpack(widget.size)
      if not w or not h then
        w,h = unpack(layout.size[widget.type])
      end
      x,y = x+targetx,y+targety
      
      return x,y,w,h
      
    end,
    
    slider = function(widget,layout,targetx,targety)
      
      local dw,dh = unpack(layout.size.slider)
      local  w, h = unpack(widget.size)
      local  x, y = unpack(widget.pos )
      if not w then w = dw end
      if not h then h = dh end
      if widget.vertical then
        w,h = h,w
      end
      x,y = x+targetx,y+targety
      
      local percOf,perc,bx,by
      
      if widget.vertical then --Bar
        
        percOf = math.percentageOf
        perc   = math.percent
        bx = x-(widget.bar[2]/4)
        by = (perc(percOf(widget.baseval,widget.values[2]),h))+y
        
      else
        
        percOf = math.percentageOf
        perc   = math.percent
        bx = (perc(percOf(widget.baseval,widget.values[2]),w))+x
        by = (widget.bar[2])+y/2
        
      end
      
      if widget.vertical then
        return bx,by,widget.bar[2],widget.bar[1]
      else
        return bx,by,widget.bar[1],widget.bar[2]
      end
      
    end,
    
    panel = function() return 0,0,0,0 end
    
  },
  
  action = {
    
    button = function(widget,layout,targetx,targety)
      
      
      widget.action()
      widget.state = "normal"
      
    end,
    
    slider = function(widget,layout,targetx,targety)
      
      if lm.isDown(1) then
        widget.state = "click"
        local mx, my = lm.getPosition()
        local  x, y = unpack(widget.pos )
        local  w, h = unpack(widget.size)
        x,y = x+targetx,y+targety
        if widget.vertical then
          widget.baseval = my-y
        else
          widget.baseval = mx-x
        end
        if widget.baseval > widget.values[2] then
          widget.baseval = widget.values[2]
        elseif widget.baseval < widget.values[1] then
          widget.baseval = widget.values[1]
        end
      end
      
    end,
    
    panel = function() end
    
  }
  
}

function menu.load(name)
  
  local object
  
  if type(name) == "table" then
    object = name
  else
    object = lf.load(("%s%s.menu"):format(dir,name))()
  end
  
  object.otheraction = object.otheraction or function() end
  
  object.__widgetHandler = widgetHandler
  local bx,by = unpack(object.layout.grid)
  
  for i in ipairs(object.widgets) do
    
    local  x, y = unpack(object.widgets[i].pos)
    
    if object.widgets[i].fixLayout then
      object.widgets[i].pos = {bx+x,by+y}
    end
    
    if not object.widgets[i].size then
      object.widgets[i].size = object.layout.size[object.widgets[i].type]
    end
    
  end
  
  object.__lastClick = 0
  
  if type(object.background[1]) == "table" then
    
    function object:draw(priority,tx,ty)
      tx = tx or 0
      ty = ty or 0
      camera.gui(
        (
          function()
            lg.setColor(unpack(self.background[1]))
            local x,y,w,h = unpack(self.background[2])
            x,y = x+tx,y+ty
            w,h = unpack(self.background[3])
            if w == "full" then w = win.w end
            if h == "full" then h = win.h end
            lg.draw(assets.image("dot"),x,y,0,math.resize(1,1 , w,h))
            lg.setColor(255,255,255,255)
            for i in ipairs(self.widgets) do
              self.__widgetHandler.draw[self.widgets[i].type](self.widgets[i],self.layout,tx,ty)
            end
          end
        ),
        priority
      )
      if console.debug then
        camera.gui(
          (
            function()
              for i,v in ipairs(self.widgets) do
                lg.setColor(229,255,0,200)
                local x,y,w,h = self.__widgetHandler.update[self.widgets[i].type](self.widgets[i],self.layout,tx,ty)
                lg.rectangle("line",x,y,w,h)
                lg.setColor(255,255,255,255)
              end
            end
          ),
          priority+1
        )
      end
    end
    
  else
    
    function object:draw(priority,tx,ty)
      tx = tx or 0
      ty = ty or 0
      camera.gui(
        (
          function()
            local img = assets.image(self.background)
            lg.draw(img,tx,ty,0,math.resize(img:getDimensions(),win.w,win.h))
            for i,v in ipairs(self.widgets) do
              self.__widgetHandler.draw[v.type](v,self.layout,tx,ty)
            end
          end
        ),
        priority
      )
      if console.debug then
        camera.gui(
          (
            function()
              for i,v in ipairs(self.widgets) do
                lg.setColor(229,255,0,200)
                local x,y,w,h = self.__widgetHandler.update[self.widgets[i].type](self.widgets[i],self.layout,tx,ty)
                lg.rectangle("line",x,y,w,h)
                lg.setColor(255,255,255,255)
              end
            end
          ),
          priority+1
        )
      end
    end
    
  end
  
  function object:update(dt,tx,ty)
    tx = tx or 0
    ty = ty or 0
    local mx, my = lm.getPosition()
    for i in ipairs(self.widgets) do
      local x,y,w,h = self.__widgetHandler.update[self.widgets[i].type](self.widgets[i],self.layout,tx,ty)
      local right,top,left,bottom = x,y,x+w,y+h
      if lm.isDown(1) and self.widgets[i].state == "click" then
        self.__widgetHandler.action[self.widgets[i].type](self.widgets[i],self.layout,tx,ty)
        return
      end
      if mx > right and mx < left then
        if my > top and my < bottom then
          if lm.isDown(1) then
            self.widgets[i].state = "click"
            self.__widgetHandler.action[self.widgets[i].type](self.widgets[i],self.layout,tx,ty)
          else
            self.widgets[i].state = "hover"
          end
        else
          self.widgets[i].state = "normal"
        end
      else
        self.widgets[i].state = "normal"
      end
    end
  end
  
  if conf.debug.profile then
    log.profile.unhook(object.update)
    log.profile.unhook(object.draw)
  end
  
  return object,func
  
end

return menu