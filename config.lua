config = {
  
  save = function()
    
    local dat = table.write(conf)
    saving.write("options", dat, "w", "conf", false, "sys")
    
  end,
  
  change = function(menu, option, value)
    
    conf[menu][option] = value
    
    log.record("Config", string.format("Changed %s/%s to %t",menu,option,value))
    
    return true
    
  end,
  
  load = function()
    
    if not lf.exists("sys/options") or true then
      --Comment this "or true" when not necessary, this is to ensure the default values are loaded for debug purposes
      
      conf = lf.load("default.conf")()
      print("Configurations file does not exist; loaded default values")
      
    else
      
      local confstr = saving.read("sys/options.conf")
      if not pcall(loadstring,confstr) then
        print("Configurations file is corrupted; loaded default values")
        conf = lf.load("default.conf")()
      else
        conf = loadstring(confstr)()
      end
      
      print("Loaded confurations")
      
    end
    
    lf.load(("resources/lang/%s.lang"):format(conf.global.language))()
    
  end
  
}