function love.load(a)
  
  local starttime = love.timer.getTime()
  local loadingIcon = love.graphics.newImage("loadingicon.png")
  love.graphics.draw(loadingIcon,0,0)
  love.graphics.present()
  
  print("---------------------")
  print(os.date())
  
  require 'util'
  
  lf = love.filesystem
  lg = love.graphics
  lk = love.keyboard
  lm = love.mouse
  io.stdout:setvbuf("no") --Disables console output buffering (Makes the output from "print" appear immediately on console)
  
  print("Initializing game, loading")
  print("Save directory",lf.getSaveDirectory())
  print("Working directory",a[1])
  print("LÖVE installation directory",a[-2])
  
  author = {
    name = "Diego García",
    contact = "dudenottelling@gmail.com"
  }
  win = {}
  
  function getGameVer()
    return "D&D Tools",1,0,1,"Alpha"
  end
  
  do --Creates a block for the local variables
    
    local fused = lf.isFused()
    
    if fused then
      print("Running in fused mode")
    else
      print("Not running in fused mode")
    end
    fused = fused
    
  end
  
  print(string.format("LÖVE %d.%d.%d - %s", love.getVersion()))
  print(string.format("%s: %d.%d.%d - %s", getGameVer()))
  
  print(string.format("Author: %s -- %s", author.name,author.contact))

  lg.setDefaultFilter("nearest", "nearest", 1) --Sets the default scaling filter (Also works for when drawing at non-interger coords)
  --Press ctrl+t (if your Project > Lua interpreter is set to LÖVE) to reveal info on the function. Set the cursor at the end of the function, but before the ) -- function|(arg1,arg2....|) Anywhere within the ||
  require 'config'
  require 'saving'
  config.load()
  require 'log'
  log.record("Main",("Loaded log core module, strict: %t"):format(log.strict))
  --conf.lua and conf.lua (and conf_loc) are DIFFERENT. conf.lua is for LÖVE, config.lua is for this code; furthermore conf_loc is the default (local) values for these; used when it is not found outside
  
  love.window.setMode(conf.window.width,conf.window.height,{vsync = conf.window.vsync, fullscreen = conf.window.fullscreen, fullscreentype = conf.window.fullscreentype}) --Sets the window mode with the data taken from confs file
  win.w,win.h = lg.getWidth(),lg.getHeight()
  space = {meter = (win.w*win.h)/10000}
  
  log.record("Window","Created window")
  log.record("Window",string.format("Width: %d, Height: %d, VSync: %t, Fullscreen: %t, Fullscreen type: %s", conf.window.width, conf.window.height, conf.window.vsync, conf.window.fullscreen, conf.window.fullscreentype))
  
  log.record("Main",string.format("1 meter = %d pixels",space.meter))
  
  lk.setKeyRepeat(true)
  utf8 = require("utf8")
  log.record("Main","Loaded UTF8 module",nil,nil,2)
  require 'callbacks'
  log.record("Main","Loaded LOVE2D callbacks module",nil,nil,2)
  log.record("Main","Loaded game module",nil,nil,2)
  require 'assets'
  log.record("Main","Loaded assets module",nil,nil,2)
  require 'notif'
  log.record("Main","Loaded notifications module",nil,nil,2)
  require 'console.console'
  console.load()
  log.record("Main","Loaded and initialized console module",nil,nil,2)
  require 'mathaddon'
  log.record("Main","Loaded Lua math add-on",nil,nil,2)
  require 'graphicsaddon'
  log.record("Main","Loaded love.graphics add-on",nil,nil,2)
  require 'camera'
  log.record("Main","Loaded camera module",nil,nil,2)
  require 'TEsound'
  log.record("Main","Loaded TEsound library",nil,nil,2)
  require 'game.game'
  game.load()
  
  log.record("Main", string.format("Loading process completed in %f seconds",love.timer.getTime()-starttime),nil,nil,2)
  if conf.debug.profile then log.profile.start() end
end

function love.run()
 
	love.load(arg)
 
	love.timer.step()
  
  local min_dt
  local next_time = love.timer.getTime()
  local cur_time
 
	local dt = 0
 
	while true do
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit() then
						return a
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end
    
		love.timer.step()
		dt = love.timer.getDelta()
    
		-- Call update and draw
    
		lg.clear    (lg.getBackgroundColor())
		lg.origin   ()
		love.update (dt)
    love.draw   ()
    
    assets.font()
    lg.setColor(255,255,255)
    if conf.global.showfps then lg.printf(love.timer.getFPS(),5,5,win.w,"left") end
    if conf.global.showplaytime then lg.printf(os.date("!%X",os.clock()), -5,5,win.w,"right") end
		
    lg.present  ()
    
    cur_time = love.timer.getTime()
    if next_time <= cur_time then
      next_time = cur_time
    else
      love.timer.sleep(next_time - cur_time) --Caps FPS at the defined value
    end
    
	end
 
end

function love.quit()
  
  config.save()
  
  if conf.debug.profile then
    log.record("profile",log.profile.report(nil,60))
    log.savelog()
  end
  
end

function love.lowmemory()
  
  log.record("Memory Manager", "Running low on memory! Memory usage: "..collectgarbage("count").."KB")
  notif.newnotif("WARNING: Running low on memory!", 2, {220,15,15})
  
  collectgarbage()
  
end