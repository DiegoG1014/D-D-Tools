local c = {}

local help = {
  
  help    = lang.cmds.help,
  clear   = lang.cmds.clear,
  fotc    = lang.cmds.fotc,
  force   = lang.cmds.force,
  sys     = lang.cmds.sys,
  load    = lang.cmds.load,
  get     = lang.cmds.get,
  lua     = lang.cmds.lua,
  draw    = lang.cmds.draw,
  atl     = lang.cmds.atl,
  debug   = lang.cmds.debug,
  move    = lang.cmds.move,
  conf    = lang.cmds.conf,
  profile = lang.cmds.profile,
  mode    = lang.cmds.mode
  
}

function c.profile(a,...)
  
  if log.strict then
    
    return select(2,pcall(log.profile[a],...))
    
  else
    
    return lang.cmds.disabled
    
  end
  
end

function c.help(f)
  
  if f then
    
    return help[f]
    
  else
    
    local a = ""
    for i,v in pairs(help) do
      a = a.."; "..i
    end
    return a
    
  end
  
end

function c.clear()
  
  console.command = ""
  console.report = ""
  console.input = ""
  console.output={}
  
end

function c.fotc()
  
  if conf.debug.otc then
    config.change("debug","otc",false)
  else
    config.change("debug","otc",true)
  end
  
end

function c.force(func)
  
  if func == "mm" then
    mM.timer = 0
  elseif func == "clearlog" then
    log.records = {}
  elseif func == "savelog" then
    log.savelog()
  else
    return lang.cmds.forceava
  end
  
  return lang.success
  
end

function c.lua(...)
  
  return loadstring(tostring(...))() or lang.cmds.luachunk
  
end

function c.sys(func)
  
  if func == "quit" then
    love.event.quit()
  elseif func == "restart" then
    love.event.quit(func)
  else
    return "sys::available = quit, restart"
  end
  
end

function c.draw(what, x, y, z, r, sx, sy, priority, id)
  
  r = tonumber(r) or 0
  if r then r = math.rad(r) end
  sx = tonumber(sx) or 0
  sy = tonumber(sy) or 0
  x = tonumber(x) or 0
  y = tonumber(y) or 0
  z = tonumber(z) or 1
  priority = tonumber(priority) or 1
  
  if id then
    
    love.addtl("update",id,function() camera.draw({d = what, pos = {x,y,z}, r = r, s = {sx,sy}},priority) end)
    
  else
    
    camera.draw({d = what, pos = {x,y,z}, r = r, s = {sx,sy}},priority)
    
  end
  
  return lang.cmds.adddrawl
  
end

function c.atl(list, name, ...)
  
  love.addtl(list,name,tostring(...))
  
end

function c.mode()
  
  if console.big then console.big = false return lang.cmds.consmall else console.big = true return lang.cmds.conbig end
  
end

local debug_data = false

function c.debug(a)
  
  if a then
    if a == "dump" then
      
      local stats = lg.getStats()
      
      log.record("Debug",string.format(lang.cmds.debug.mouse, love.mouse.getPosition()))
      log.record("Debug",string.format(lang.cmds.debug.camr, unpack(camera.pos)))
      log.record("Debug",string.format(lang.cmds.debug.camg, unpack(camera.goal)))
      log.record("Debug",string.format(lang.cmds.debug.drawc,stats.drawcalls,stats.canvasswitches))
      log.record("Debug",string.format(lang.cmds.debug.txmem,stats.texturememory/1024,stats.images))
      log.record("Debug",string.format(lang.cmds.debug.canfon,stats.canvases,stats.fonts))
      log.record("Debug",string.format(lang.cmds.debug.shade,stats.shaderswitches))
      
      return lang.cmds.debug.dump
      
    elseif a == "sublog" then
      
      if log.sublog then
        log.sublog = false
      else
        log.sublog = true
      end
      
      return (lang.cmds.debug.sublog):format(log.sublog)
      
    else
      
      error(("Wrong argument to debug. String expected containing \"dump\". got %s containing %t."):format(type(a),a))
      
    end
    
  else
    
    if not console.debug then
      
      local function debugFunc()
        
        assets.font("lucon",16)
        lg.setColor(255,120,120,255)
        
        local stats = lg.getStats()
        
        lg.setColor(120,120,255,200)
        lg.rectangle("fill",0,10,400,150)
        lg.setColor(255,120,120,255)
        lg.print(string.format(lang.cmds.debug.mouse, love.mouse.getPosition()),5,20)
        lg.print(string.format(lang.cmds.debug.camr, unpack(camera.curr)),5,40)
        lg.print(string.format(lang.cmds.debug.camg, unpack(camera.goal)),5,60)
        lg.print(string.format(lang.cmds.debug.drawc,stats.drawcalls,stats.canvasswitches),5,80)
        lg.print(string.format(lang.cmds.debug.txmem,stats.texturememory/1024,stats.images),5,100)
        lg.print(string.format(lang.cmds.debug.canfon,stats.canvases,stats.fonts),5,120)
        lg.print(string.format(lang.cmds.debug.shade,stats.shaderswitches),5,140)
        
      end
      
      love.addtl("update","debugDrawInfo",function() camera.gui(debugFunc,5) end)
      
      console.debug = true
      return lang.cmds.debug.active
      
    elseif console.debug then
      
      love.remfl("update","debugDrawInfo")
      console.debug = false
      return lang.cmds.debug.deactive
      
    end
    
  end
  
end

function c.move(what,...)
  
  if what == "camera" then
    
    local x,y,r,z = tonumber(...)
    
    if not x or y or r or z then
      return lang.cmds.camwarn
    end
    
    camera.move(x,y,r,z)
    
    return lang.cmds.cammove
    
  end
  
end

function c.conf(menu,option,value)
  
  return config.change(menu,option,value)
  
end

function c.load(what, ...)
  
  return loadfunc[what](...)
  
end

local getList = {
  
  gui = function() return table.write(camerapast.guiList,true) end,
  draw = function() return table.write(camerapast.drawList,true) end,
  fx   = function() return table.write(camerapast.fxList,true) end,
  update = function() return table.write(callList.update,true) end
  
}

function c.get(queue)
  
  return pcall(getList[queue])
  
end

return c