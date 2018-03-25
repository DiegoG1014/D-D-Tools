game = {
  
  state = {
    
    map       = nil,
    movecam   = false,
    selected  = {},
    chscroll  = 0,
    mapscroll = 0,
    entities  = 0
    
  },
  
  colors = {
    
    border = {
      
      hover = {42,100,158,255},
      normal = {56,84,162,255},
      click = {20,20,20,255}
      
    },
    
    button = {
      
      hover = {20,40,60,255},
      normal = {40,80,110,255},
      click = {20,20,20,255}
      
    },
    
    font = {
      
      hover = {15,0,15,255},
      normal = {0,0,15,255},
      click = {30,100,255,255},
      fontname = "copperplate gothic bold",
      
      white = {
        
        hover = {200,200,200,255},
        normal = {200,200,240,255},
        click = {255,255,255,255},
        fontname = "copperplate gothic bold"
        
      }
      
    },
    
    sliderbar = {75,80,200,255},
    
    slider = {
      
      hover = {20,40,60,255},
      normal = {40,80,110,255},
      click = {200,200,222,255}
      
    },
    
    blank = {
      
      hover = {0,0,0,0},
      normal = {0,0,0,0},
      click = {0,0,0,0}
      
    },
    
    char = {
      
      button = {
        
        players  = {
          
          hover = {20,40,60,255},
          normal = {40,80,180,255},
          click = {20,20,20,255}
          
        },
        
        monsters = {
          
          hover = {20,40,60,255},
          normal = {180,80,40,255},
          click = {20,20,20,255}
          
        },
        
        other    = {
          
          hover = {20,40,60,255},
          normal = {40,180,80,255},
          click = {20,20,20,255}
          
        }
        
      },
      
      names = {
        
        hover = {200,200,200,255},
        normal = {200,200,200,255},
        click = {200,200,200,255}
        
      }
      
    }
  }
  
}

game.colors.char[true] = {
  
  hover = {60,140,60,255},
  normal = {40,120,40,255},
  click = {20,100,20,255}
  
}

game.colors.char[false] = {
  
  hover = {140,60,60,255},
  normal = {120,40,40,255},
  click = {100,20,20,255}
  
}

local actions = {
  
  c = function()
    
    if game.state.movecam then
      
      game.state.movecam = false
      lm.setVisible(true)
      
    else
      
      game.state.movecam = true
      lm.setVisible(false)
      
    end
    
  end,
  
  ["kp+"] = function()
    
    camera.move(0,0,0,0.2)
    
  end,
  
  ["kp-"] = function()
    
    camera.move(0,0,0,-0.2)
    
  end,
  
  w = function()
    
    if game.state.selected then
      game.state.selected.pos[2] = game.state.selected.pos[2] -1
    end
    if game.state.movecam then
      camera.move(0,-20,0,0)
    end
    
  end,
  
  a = function()
    
    if game.state.selected then
      game.state.selected.pos[1] = game.state.selected.pos[1] -1
    end
    if game.state.movecam then
      camera.move(-20,0,0,0)
    end
    
  end,
  
  s = function()
    
    if game.state.selected then
      game.state.selected.pos[2] = game.state.selected.pos[2] +1
    end
    if game.state.movecam then
      camera.move(0,20,0,0)
    end
    
  end,
  
  d = function()
    
    if game.state.selected then
      game.state.selected.pos[1] = game.state.selected.pos[1] +1
    end
    if game.state.movecam then
      camera.move(20,0,0,0)
    end
    
  end
  
}

function game.update(dt)
  
  local iw,ih = game.bg:getDimensions()
  lg.setColor(255,255,255,150)
  lg.draw(game.bg,0,0,0,math.resize(iw,ih,win.w,win.h))
  lg.setColor(255,255,255,255)
  
  for i,v in pairs(game.state.menus) do
    
    if v[3] then
      
      log.subrecord("Game","Loading menu: "..i)
      
      if i == "__characters" then
        game.state.menus[i][1]:update(dt,0,game.state.chscroll)
        game.state.menus[i][1]:draw(2,0,game.state.chscroll)
      elseif i == "__map" then
        game.state.menus[i][1]:update(dt,0,game.state.mapscroll)
        game.state.menus[i][1]:draw(2,0,game.state.mapscroll)
      else
        game.state.menus[i][1]:update(dt,0,0)
        game.state.menus[i][1]:draw(1,0,0)
        game.state.menus[i][1]:otheraction()
      end
      
    end
    
  end
  
  if game.state.map then --tm = texturemap, om = objectmap
    
    game.state.map:draw(0,0,conf.game.gridopacity)
    
  end
  
  for i,v in pairs(game.state.entities) do
    for i1,v1 in pairs(v) do
      if game.state.entities[i][i1][1].state then
        game.state.entities[i][i1][1]:draw(unpack(game.state.entities[i][i1][1].pos))
        game.state.entities[i][i1][1]:update(dt)
      end
    end
  end
  
  if game.state.movecam then
    
    lm.setPosition(win.w/2,win.h/2)
    
  end
  
end

function game.load()
  
  game.modules = {
    maphandler = require 'game.maphandler',
    entities   = require 'game.entities',
    menu       = require 'game.menu',
  }
  
  game.maps = {}
  
  for i,v in ipairs(lf.getDirectoryItems("resources/maps")) do
    
    table.insert(game.maps,#game.maps,{game.modules.maphandler.load(v),v})
    
  end
  
  game.state.menus = {
    main       = {game.modules.menu.load("main"),3,true},
    settings   = {game.modules.menu.load("settings"),3,false},
    characters = {game.modules.menu.load("characters"),3,false},
    lootgen    = {game.modules.menu.load("lootgen"),3,false},
    map        = {game.modules.menu.load("mapselect"),3,false}
  }
  
  game.state.entities = {
    
    players  = {
      
      
      
    },
    
    monsters = {
      
      
      
    },
    
    other    = {
      
      
      
    }
    
  }
  
  log.record("Game","Finished loading required libraries")
  
  game.bg = assets.image("menu/background")
  
  love.addtl("update","game",game.update)
  love.addtl("keypressed","game",game.keypressed)
  love.addtl("mousemoved","game",game.mousemoved)
  
end

function game.keypressed(k)
  
  pcall(actions[k])
  
end

function game.mousemoved(x, y, dx, dy)
  
  
  
end

function game.start()
  
  
  
end

function game.stop()
  
  
  
end