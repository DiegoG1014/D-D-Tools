local maphandler = {
  
  load  = function(name)
    
    local map
    
    do
      local first,last = string.find(name,".map")
      if first == #name-3 then
        map = lf.load(("resources/maps/%s"):format(name))()
      else
        map = lf.load(("resources/maps/%s.map"):format(name))()
      end
    end
    
    log.subrecord("Maphandler","Drawing map")
    local cellsize = 32--(#map.tm + #map.tm[1])/2
    local prevCanvas = lg.getCanvas()
    
    map.drawDat = {
      
      ground  = lg.newCanvas(#map.tm[1]*cellsize,#map.tm*cellsize),
      grid    = lg.newCanvas(#map.tm[1]*cellsize,#map.tm*cellsize),
      objects = lg.newCanvas(#map.tm[1]*cellsize,#map.tm*cellsize)
      
    }
    
    local size = math.resize(32,cellsize)
    
    lg.setCanvas(map.drawDat.ground)
    
    for y=1, #map.tm do
      
      for x=1, #map.tm[y] do
        
        lg.setColor(255,255,255,255)
        lg.draw(assets.image(map.tmconf[map.tm[y][x]+1]),x*cellsize,y*cellsize,0, size,size)
        
      end
      
    end
    
    lg.setCanvas(map.drawDat.grid)
    
    for y=1, #map.tm do
      
      for x=1, #map.tm[y] do
        
        lg.setColor(255,255,255,255)
        lg.rectangle("line", (x * cellsize), (y * cellsize), cellsize, cellsize)
        
      end
      
    end
    
    lg.setCanvas(map.drawDat.objects)
    
    for y=1, #map.om do
      
      for x=1, #map.om[y] do
        
        if map.om[y][x] > 0 then
          lg.setColor(255,255,255,255)
          lg.draw(assets.image(map.omconf[map.om[y][x]]), x*cellsize, y*cellsize, 0, size,size)
        end
        
      end
      
    end
    
    lg.setCanvas(prevCanvas)
    
    function map:draw(x,y,o)
      
      camera.draw(self.drawDat.ground,x,y,0,1,1, "canvas", 1)
      camera.draw(self.drawDat.grid,x,y,0,1,1, "canvas", 2, {255,255,255,o})
      camera.draw(self.drawDat.objects,x,y,0,1,1, "canvas", 3)
      
    end
    
    return map
    
  end,
  
  maplist = function()
    
    game.state.menus.main[3] = false
    game.state.menus.map[3]  = true
    game.state.menus.__map   = {
      
      widgets = {},
      
      layout = {
        
        grid = { 15,10 },
        size = {
          
          button = { 200,50 },
          panel  = { win.w/2,70 }
          
        }
        
      }
      
    }
    
    local sepx,sepy = 0,0
    local repeats = 0
    
    for i,v in pairs(game.maps) do
      
      sepy = sepy+1
      
      local map = {
        
        type      = "button",
        pos       = {65,(80*sepy)+15},
        size      = {100,50},
        fixLayout = false,
        text      = {string.sub(v[2],1,#v[2]-4),"center","bottom",{0,16}},
        action    = function() game.state.map = game.maps[i][1] end,
        border    = {3,color = game.colors.border},
        color     = game.colors.button,
        font      = {"copperplate gothic bold", 12, align = "center", color = game.colors.font.white},
        state     = "normal"
        
      }
      
      table.insert(game.state.menus.__map.widgets,map)
      
    end
    
    game.state.menus.__map.background = {
      
      {3,10,20,220},
      {0,0},
      {(win.w/3)-50,(80*sepy)+120}
      
    }
    
    game.state.menus.__map = {game.modules.menu.load(game.state.menus.__map),5,true}
    
  end
  
}

return maphandler