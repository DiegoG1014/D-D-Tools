credits = {
  
  dg = {lang.credits.dg,"Diego García"},
  lb = {lang.credits.lb, "Lenin Briceño"},
  tpm = {lang.credits.tpm, {
    {lang.credits.TEsound, "'Ensayia', 'Taehl' love2d.org/wiki/TEsound"},
		{"Shine", "'Matthias Richter' github.com/vrld/"},
    {lang.credits.bump, "'Kikito' github.com/kikito/bump.lua"},
    {lang.credits.rich, "'Robin Wellner', 'Florian Fischer' https://github.com/gvx/richtext"}
    }
  },
  framework = lang.credits.engine
}

function loopCredits(t)
  
  log.record("Credits","Rolling...")
  
  for i,v in pairs(t) do
    
    if type(v[2]) == "table" then
      
      loopCredits(v[2])
      
    else
      
      print(v[1],v[2])
      
    end
    
  end

end