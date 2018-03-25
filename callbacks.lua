function love.addtl(list, name, func)
  
  callList[list][name] = func
  log.record("Main","Added "..name.." entry into "..list)
  
end

function love.remfl(list, name)
  
  callList[list][name] = nil
  log.record("Main","Removed "..name.." entry into "..list)
  
end

callList = {
  
  update        = {},
  textinput     = {},
  keypressed    = {},
  mousemoved    = {},
  mousepressed  = {},
  mousereleased = {}
  
}
  
local function reportError(a,b,str)
  
  log.record("Callbacks", ("Unable to execute: %t - %t, error: %s"):format(a,b,str), true, 1)
  
end

--[[
  
  Basically, for all of this; it's a queue list. You register yourself, you get updated, and/or get input forwarded to you.
  
--]]

function love.update(dt)
  
  _G.dt = dt
  _ = nil
  
  love.system.setClipboardText("marico el q lo lea -- P.D.: Lenin es marico")
  
  local loopCount = 0
  
  log.subrecord("Main", "Memory usage: "..collectgarbage("count").." KB")
  if collectgarbage("count") > (1*(1024^2)) then love.lowmemory() end
  if dt > 30/conf.global.fpscap then log.record("Update","Can't keep up! System time changed or Game overloaded. Running below half of target framerate!"..dt) return end
  log.subrecord("Update",dt)
  
  for i,v in pairs(callList.update) do
    
    loopCount = loopCount + 1
    if log.strict then
      v(dt)
    else
      local s,msg = pcall(v,dt)
      if not s then reportError(i,v,msg) end
    end
    
  end
  
  TEsound.cleanup()
  
  log.subrecord("Update",("Updated %d objects"):format(loopCount))
  
end

function love.textinput(t)
  
  for i,v in pairs(callList.textinput) do
    
    if log.strict then
      v(t)
    else
      local s,msg = pcall(v,t)
      if not s then reportError(i,v,msg) end
    end
    
  end
  
end

function love.keypressed(key)
  
  if key == conf.global.screenshotkey then
    
    local screenshot = lg.newScreenshot(true)
    saving.dir("screenshots",true,"Main")
    
    screenshot:encode('png', "screenshots/"..os.time() .. math.random(0,1000) .. '.png')
    
    log.record("Main","Screenshot taken and saved to: "..lf.getSaveDirectory().."/screenshots/"..os.time()..".png")
    notif.newnotif("Screenshot taken and saved to: "..lf.getSaveDirectory().."/screenshots/"..os.time()..".png")
    
  end
  
  for i,v in pairs(callList.keypressed) do
    if log.strict then
      v(key)
    else
      local s,msg = pcall(v,key)
      if not s then reportError(i,v,msg) end
    end
  end
  
end

function love.mousemoved(x, y, dx, dy)
  
  for i,v in pairs(callList.mousemoved) do
    if log.strict then
      v(x, y, dx, dy)
    else
      local s,msg = pcall(v, x, y, dx, dy)
      if not s then reportError(i,v,msg) end
    end
  end
  
end

function love.mousepressed(x,y,button)
  
  for i,v in pairs(callList.mousepressed) do
    if log.strict then
      v(x, y, dx, dy)
    else
      local s,msg = pcall(v, x, y, dx, dy)
      if not s then reportError(i,v,msg) end
    end
  end
  
end

function love.mousereleased(x,y,button)
  
  for i,v in pairs(callList.mousereleased) do
    if log.strict then
      v(x, y, dx, dy)
    else
      local s,msg = pcall(v, x, y, dx, dy)
      if not s then reportError(i,v,msg) end
    end
  end
  
end

function love.focus(f)
  
  
  
end

function love.threaderror(thread, errstr)
  
  -- [love.threaderror](https://love2d.org/wiki/love.threaderror)
  -- [Threads](https://love2d.org/wiki/Thread)
  
end