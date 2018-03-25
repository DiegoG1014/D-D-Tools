local reloadcharlist

local entities = {
  
  load = function(file)
    
    local object
    
    do
      local first,last = string.find(file,".ent")
      if first == #file-3 then
        object = lf.load(("resources/entities/%s"):format(file))()
      else
        object = lf.load(("resources/entities/%s.ent"):format(file))()
      end
    end
    
    object.state    = false
    object.pos      = {0,0}
    object.show     = false
    
    if object.anim then
      
      object.anim = assets.animation(object.anim.name,object.anim.data)
      
      function object:draw(x,y)
        
        x,y = (x*32)-(16),(y*32)-(16)
        
        if game.state.selected == self then
          camera.fx(
            function(cx,cy,cr,cz)
              
              lg.setColor(100,100,255,150)
              lg.rectangle("fill",x+cx-16,y+cy-16,32,32)
              
            end,
            3,"B"
          )
          
        end
        
        self.anim:draw(x,y,0,1,1,4)
        
      end
      
      function object:update(dt)
        
        self.anim:update(dt)
        
      end
      
    else
      
      function object:draw(x,y)
        
        local cx,cy,cr,cz = unpack(camera.curr)
        x,y = (x*32)-(16-cz),(y*32)-(16-cz)
        local color = {255,255,255,255}
        
        if game.state.selected == self then
          camera.fx(
            function(cx,cy,cr,cz)
              
              lg.setColor(100,100,255,150)
              lg.rectangle("fill",x+cx-16,y+cy-16,32,32)
              
            end,
            1,"B"
          )
          
        end
        
        camera.draw(assets.image(self.sprite),x,y,0,1,1, "image", 4, color)
        
      end
      
      function object:update()
        
        
        
      end
      
      
    end
    
    function object:showcase()
      
      local drawfunc = function()
        
        local midx = (win.w/2)-360
        local midy = (win.h/2)-120
        local a = {#self.name,#self.race,#self.class}
        table.sort(a)
        
        assets.font("copperplate gothic bold")
        lg.setColor(0,0,0,200)
        lg.rectangle("fill",midx+3,midy+3,353,353)
        lg.setColor(40,40,50,255)
        lg.rectangle("fill",midx,midy,350,350)
        lg.setColor(255,255,255,255)
        if self.anim then
          local img,quad = assets.texture(self.anim:getStage())
          lg.draw(img,quad,midx,midy,0,math.resize(32,32,350,350))
        else
          lg.draw(assets.image(self.sprite),midx,midy,0,math.resize(32,32,350,350))
        end
        lg.setColor(20,20,20,235)
        lg.rectangle("fill",midx+360,midy,12*a[3],52)
        lg.setColor(235,235,235,255)
        lg.print(self.name,midx+368,midy)
        lg.print(self.race,midx+368,midy+16)
        lg.print(self.class,midx+368,midy+32)
        
      end
      
      camera.gui(drawfunc , 5, "B")
      
    end
    
    return object
    
  end,
  
  charlist = function()
    
    game.state.menus.main[3] = false
    game.state.menus.characters[3] = true
    game.state.menus.__characters = {
      
      widgets = {},
      
      layout = {
        
        grid = { (win.w/2)-(220/2),10 },
        size = {
          
          button = { 200,50 },
          panel  = { win.w/2,70 }
          
        }
        
      }
      
    }
    
    local sepx,sepy = 0,0
    
    for i,v in pairs(game.state.entities) do
      
      table.insert(game.state.menus.__characters.widgets, {--Group
        
        type      = "panel",
        pos       = {win.w-(75*4+42),(112*sepy+1)+15},
        size      = {win.w,50},
        fixLayout = false,
        text      = {lang.game[i],"left","center",{10,0}},
        border    = {0,color = {0,0,0,0}},
        color     = {3,10,20,200},
        font      = {"copperplate gothic bold", 12, align = "center", color = {200,200,200,255}},
        state     = "normal"
        
      })
      
      for i1,v1 in pairs(v) do
        if sepx < 3 then
          sepx = sepx+1
        else
          sepx = 1
          sepy = sepy+1
        end
        
        local char = {
          
          type      = "button",
          pos       = {(win.w)-(72*sepx),(112*sepy)+15},
          size      = {64,64},
          fixLayout = false,
          text      = {game.state.entities[i][i1][1].name,"center","bottom",{0,16}},
          icon      = {game.state.entities[i][i1][1].sprite,0,0,64,64},
          action    = function() game.state.entities[i][i1][1]:showcase();game.state.selected = game.state.entities[i][i1][1] end,
          border    = {3,color = game.colors.char[game.state.entities[i][i1][1].state]},
          color     = game.colors.char.button[i],
          font      = {"copperplate gothic bold", 12, align = "center", color = game.colors.char.names},
          state     = "normal"
          
        }
        
        local revive = {
          
          type      = "button",
          pos       = {(win.w)-(72*sepx)+15,(112*sepy)+97},
          size      = {16,16},
          fixLayout = false,
          text      = {"","right","bottom",{-18,0}},
          icon      = {"icons/life",0,0,16,16},
          action    = function() game.state.entities[i][i1][1].state = true end,
          border    = {1,color = game.colors.border},
          color     = game.colors.button,
          font      = {"lucon", 12, align = "center", color = game.colors.font},
          state     = "normal"
          
        }
        
        local kill   = {
          
          type      = "button",
          pos       = {(win.w)-(72*sepx)+31,(112*sepy)+97},
          size      = {16,16},
          fixLayout = false,
          text      = {"","center","bottom",{0,0}},
          icon      = {"icons/death",0,0,16,16},
          action    = function() game.state.entities[i][i1][1].state = false end,
          border    = {1,color = game.colors.border},
          color     = game.colors.button,
          font      = {"lucon", 12, align = "center", color = game.colors.font},
          state     = "normal"
          
        }
        
        table.insert(game.state.menus.__characters.widgets,char)
        table.insert(game.state.menus.__characters.widgets,revive)
        table.insert(game.state.menus.__characters.widgets,kill)
        
      end
      
      sepy = sepy +1
      sepx = 0
      
    end
    
    local reload = {
      
      type      = "button",
      pos       = {(win.w)-130,(112*sepy)+97},
      size      = {52,24},
      fixLayout = false,
      text      = {"Reload","center","center",{0,0}},
      action    = function() reloadcharlist() end,
      border    = {1,color = game.colors.border},
      color     = game.colors.button,
      font      = {"lucon", 12, align = "center", color = game.colors.font},
      state     = "normal"
      
    }
    
    table.insert(game.state.menus.__characters.widgets,reload)
    
    game.state.menus.__characters.background = {
      
      {3,10,20,220},
      {win.w-(75*3),0},
      {win.w/3,(112*sepy)+120}
      
    }
    
    game.state.menus.__characters = {game.modules.menu.load(game.state.menus.__characters),5,true}
    
  end
  
}

reloadcharlist = function()

  local typedef = {
    "players",
    "monsters",
    "other"
  }
  
  game.state.entities = {
    
    players  = {
      
      
      
    },
    
    monsters = {
      
      
      
    },
    
    other    = {
      
      
      
    }
    
  }
  
  for i,v in ipairs(lf.getDirectoryItems("resources/entities")) do
    
    local ent  = game.modules.entities.load(v)
    local entt = {ent,v}
    
    table.insert(game.state.entities[typedef[ent.type]],#game.state.entities[typedef[ent.type]],entt)
    
  end
  
  entities.charlist()
  
end

return entities