local gen = {}

local info = {armors={},shields={},effects={shield={{},{},{}},armor={{},{},{}}}}

info.armors[1] = {"Acolchada", 155}
info.armors[2] = {"Cuero", 160}
info.armors[3] = {"Cuero tachonado", 175}
info.armors[18]= {"Camisote de mallas", 250}
info.armors[33]= {"Pieles", 165}
info.armors[43]= {"Cota de escamas", 200}
info.armors[44]= {"Coraza", 350}
info.armors[58]= {"Laminada", 350}
info.armors[59]= {"Cota de bandas", 400}
info.armors[60]= {"Placas y mallas", 750}
info.armors[61]= {"Completa", 1650}
info.armors[100]= {"Completa", 1650}

info.shields[1] = {"Broquel o Rodela",165}
info.shields[11]= {"Escudo ligero de madera",153}
info.shields[16]= {"Escudo ligero de acero",159}
info.shields[21]= {"Escudo pesado de madera",157}
info.shields[31]= {"Escudo pesado de acero",170}
info.shields[96]= {"Escudo pavés",180}
info.shields[100]= {"Escudo pavés",180}

info.effects.shield[1][1] = {"Atrapaflechas",8000}
info.effects.shield[1][21]= {"Golpeador",8000}
info.effects.shield[1][41]= {"Cegador",8000}
info.effects.shield[1][51]= {"Fortificante leve",8000}
info.effects.shield[1][76]= {"Desviaflechas",12000}
info.effects.shield[1][93]= {"Animado",12000}
info.effects.shield[1][98]= {"Resistente a conjuros (13)",12000}
info.effects.shield[1][100]= {"Resistente a conjuros (13)",12000}
info.effects.shield[1].qnt = 7

info.effects.shield[2][1] = {"Atrapaflechas",8000}
info.effects.shield[2][11]= {"Golpeador",8000}
info.effects.shield[2][22]= {"Cegador",8000}
info.effects.shield[2][26]= {"Fortificante leve",8000}
info.effects.shield[2][41]= {"Desviaflechas",12000}
info.effects.shield[2][51]= {"Animado",12000}
info.effects.shield[2][58]= {"Resistente a conjuros (13)",12000}
info.effects.shield[2][60]= {"Resistente al ácido",18000}
info.effects.shield[2][64]= {"Resistente al frío",18000}
info.effects.shield[2][68]= {"Resistente a la electricidad",18000}
info.effects.shield[2][72]= {"Resistente al fuego",18000}
info.effects.shield[2][76]= {"Resistente al sonido",18000}
info.effects.shield[2][80]= {"Fantasmal",18000}
info.effects.shield[2][86]= {"Fortificante moderado",18000}
info.effects.shield[2][96]= {"Resistente a conjuros (15)",18000}
info.effects.shield[2][99]= {"Salvaje",18000}
info.effects.shield[2][100]= {"Salvaje",18000}
info.effects.shield[2].qnt = 16

info.effects.shield[3][1] = {"Atrapaflechas",8000}
info.effects.shield[3][6] = {"Golpeador",8000}
info.effects.shield[3][9] = {"Cegador",8000}
info.effects.shield[3][11]= {"Fortificante leve",8000}
info.effects.shield[3][16]= {"Desviaflechas",12000}
info.effects.shield[3][21]= {"Animado",12000}
info.effects.shield[3][26]= {"Resistente al ácido",18000}
info.effects.shield[3][29]= {"Resistente al frío",18000}
info.effects.shield[3][32]= {"Resistente a la electricidad",18000}
info.effects.shield[3][35]= {"Resistente al fuego",18000}
info.effects.shield[3][38]= {"Resistente al sonido",18000}
info.effects.shield[3][41]= {"Fantasmal",18000}
info.effects.shield[3][47]= {"Fortificante moderado",18000}
info.effects.shield[3][57]= {"Resistente a conjuros (15)",18000}
info.effects.shield[3][59]= {"Salvaje",18000}
info.effects.shield[3][60]= {"Resistente al ácido, mejorado",42000}
info.effects.shield[3][65]= {"Resistente al frío, mejorado",42000}
info.effects.shield[3][70]= {"Resistente a la electricidad, mejorado",42000}
info.effects.shield[3][75]= {"Resistente al fuego, mejorado",42000}
info.effects.shield[3][80]= {"Resistente al sonido, mejorado",42000}
info.effects.shield[3][85]= {"Resistente a conjuros (17)",42000}
info.effects.shield[3][87]= {"De controlar muertos vivientes",49000}
info.effects.shield[3][88]= {"Fortificante intenso",49000}
info.effects.shield[3][92]= {"Reflectante",49000}
info.effects.shield[3][94]= {"Resistente a conjuros (19)",49000}
info.effects.shield[3][95]= {"Resistente al ácido, mayor",49000}
info.effects.shield[3][96]= {"Resistente al frío, mayor",49000}
info.effects.shield[3][97]= {"Resistente a la electricidad, mayor",49000}
info.effects.shield[3][98]= {"Resistente al fuego, mayor",49000}
info.effects.shield[3][99]= {"Resistente al sonido, mayor",49000}
info.effects.shield[3][100]= {"Resistente al sonido, mayor",49000}
info.effects.shield[3].qnt = 30

info.effects.armor[1][1] = {"Ilusoria",2700}
info.effects.armor[1][26]= {"Fortificante leve",2700}
info.effects.armor[1][33]= {"Resbaladiza",3750}
info.effects.armor[1][53]= {"De las sombras",3750}
info.effects.armor[1][73]= {"Silenciosa",3750}
info.effects.armor[1][93]= {"Resistente a Conjuros (13)",3750}
info.effects.armor[1][97]= {"Resbaladiza, mejorada",15000}
info.effects.armor[1][98]= {"De las sombras, mejorada",15000}
info.effects.armor[1][99]= {"Silenciosa, mejorada",15000}
info.effects.armor[1][100]= {"Silenciosa, mejorada",15000}
info.effects.armor[1].qnt = 9

info.effects.armor[2][1] = {"Ilusoria",2700}
info.effects.armor[2][6] = {"Fortificante leve",2700}
info.effects.armor[2][9] = {"Resbaladiza",3750}
info.effects.armor[2][12]= {"De las sombras",3750}
info.effects.armor[2][15]= {"Silenciosa",3750}
info.effects.armor[2][18]= {"Resistente a Conjuros (13)",3750}
info.effects.armor[2][20]= {"Resbaladiza, mejorada",15000}
info.effects.armor[2][30]= {"De las sombras, mejorada",15000}
info.effects.armor[2][40]= {"Silenciosa, mejorada",15000}
info.effects.armor[2][50]= {"Resistente al ácido",18000}
info.effects.armor[2][55]= {"Resistente al frío",18000}
info.effects.armor[2][60]= {"Resistente a la electricidad",18000}
info.effects.armor[2][65]= {"Resistente al fuego",18000}
info.effects.armor[2][70]= {"Resistente al sonido",18000}
info.effects.armor[2][75]= {"Fantasmal",18000}
info.effects.armor[2][80]= {"De invulnerabilidad",18000}
info.effects.armor[2][85]= {"Fortificante moderada",18000}
info.effects.armor[2][90]= {"Resistente a conjuros (15)",18000}
info.effects.armor[2][99]= {"Salvaje",18000}
info.effects.armor[2][100]= {"Salvaje",18000}
info.effects.armor[2].qnt = 19

info.effects.armor[3][1] = {"Ilusoria",2700}
info.effects.armor[3][4] = {"Fortificante leve",2700}
info.effects.armor[3][5] = {"Resbaladiza, mejorada",15000}
info.effects.armor[3][8] = {"De las sombras, mejorada",15000}
info.effects.armor[3][11]= {"Silenciosa, mejorada",15000}
info.effects.armor[3][14]= {"Resistente al ácido",18000}
info.effects.armor[3][17]= {"Resistente al frío",18000}
info.effects.armor[3][20]= {"Resistente a la electricidad",18000}
info.effects.armor[3][23]= {"Resistente al fuego",18000}
info.effects.armor[3][26]= {"Resistente al sonido",18000}
info.effects.armor[3][29]= {"Fantasmal",18000}
info.effects.armor[3][34]= {"De invulnerabilidad",18000}
info.effects.armor[3][36]= {"Fortificante moderada",18000}
info.effects.armor[3][41]= {"Resistente a conjuros (15)",18000}
info.effects.armor[3][43]= {"Salvaje",18000}
info.effects.armor[3][44]= {"Resbaladiza, mayor",18000}
info.effects.armor[3][49]= {"De las sombras, mayor",18000}
info.effects.armor[3][54]= {"Silenciosa, mayor",18000}
info.effects.armor[3][59]= {"Resistente al ácido, mejorada",18000}
info.effects.armor[3][64]= {"Resistente al frío, mejorada",18000}
info.effects.armor[3][69]= {"Resistente a la electricidad, mejorada",18000}
info.effects.armor[3][74]= {"Resistente al fuego, mejorada",18000}
info.effects.armor[3][79]= {"Resistente al sonido, mejorada",18000}
info.effects.armor[3][84]= {"Resistente a conjuros (17)",18000}
info.effects.armor[3][89]= {"De etereidad",18000}
info.effects.armor[3][90]= {"De controlar muertos vivientes",18000}
info.effects.armor[3][91]= {"Fortificante intensa",18000}
info.effects.armor[3][93]= {"Resistente a conjuros (19)",18000}
info.effects.armor[3][95]= {"Resistente al ácido, mayor",18000}
info.effects.armor[3][96]= {"Resistente al frío, mayor",18000}
info.effects.armor[3][97]= {"Resistente a la electricidad, mayor",18000}
info.effects.armor[3][98]= {"Resistente al fuego, mayor",18000}
info.effects.armor[3][99]= {"Resistente al sonido, mayor",18000}
info.effects.armor[3][100]= {"Resistente al sonido, mayor",18000}
info.effects.armor[3].qnt = 33

if true then
  
  local ind, cv = 100, nil
  
  while ind > 0 do
    
    if info.armors[ind] then
      cv = info.armors[ind]
    else
      info.armors[ind] = cv
    end
    
    ind = ind -1
    
  end
  
  ind, cv = 100, nil
  
  while ind > 0 do
    
    if info.shields[ind] then
      cv = info.shields[ind]
    else
      info.shields[ind] = cv
    end
    
    ind = ind -1
    
  end
  
  ind, cv = 100, nil
  
  while ind > 0 do
    
    if info.shields[ind] then
      cv = info.shields[ind]
    else
      info.shields[ind] = cv
    end
    
    ind = ind -1
    
  end
  
  ind, cv = 100, nil
  
  local levels = 3
  
  while levels > 0 do
    
    while ind > 0 do
      
      if info.effects.armor[levels][ind] then
        cv = info.effects.armor[levels][ind]
      else
        info.effects.armor[levels][ind] = cv
      end
      
      ind = ind -1
      
    end
    
    levels = levels -1
    ind = 100
    
  end
  
  levels = 3
  
  while levels > 0 do
    
    while ind > 0 do
      
      if info.effects.shield[levels][ind] then
        cv = info.effects.shield[levels][ind]
      else
        info.effects.shield[levels][ind] = cv
      end
      
      ind = ind -1
      
    end
    
    levels = levels -1
    ind = 100
    
  end
  
end

function gen.generate(level)
  
  local a = rand(1,100,rand(-125,536,rand(-69,69,69)))
  local obj = {
    
    type_ = "",
    price = 0,
    name = "",
    modQnt = 0,
    mods = {}
    
  }
  
  local typeroll = true
  
  while typeroll do
    
    typeroll = false
    
    if level <= 1 then
      
      if a > 0 and a < 61 then
        
        obj.type_ = "Escudo +1"
        obj.isShield = true
        obj.price = 1000
        
      elseif a > 60 and a < 81 then
        
        obj.type_ = "Armadura +1"
        obj.isShield = false
        obj.price = 1000
        
      elseif a > 80 and a < 86 then
        
        obj.type_ = "Escudo +2"
        obj.isShield = true
        obj.price = 4000
        
      elseif a > 85 and a < 88 then
        
        obj.type_ = "Armadura +2"
        obj.isShield = false
        obj.price = 4000
        
      elseif a > 87 and a < 90 then
        
        obj.type_ = "Armadura especifica"
        
      elseif a > 89 and a < 92 then
        
        obj.type_ = "Escudo especifico"
        
      elseif a > 91 then
        
        obj.modQnt = obj.modQnt + 1
        
      end
      
    elseif level == 2 then
      
      if a > 0 and a < 6 then
        
        obj.type_ = "Escudo +1"
        obj.isShield = true
        obj.price = 1000
        
      elseif a > 5 and a < 11 then
        
        obj.type_ = "Armadura +1"
        obj.price = 1000
        
      elseif a > 10 and a < 21 then
        
        obj.type_ = "Escudo +2"
        obj.isShield = true
        obj.price = 4000
        
      elseif a > 20 and a < 31 then
        
        obj.type_ = "Armadura +2"
        obj.isShield = false
        obj.price = 4000
        
      elseif a > 30 and a < 41 then
        
        obj.type_ = "Escudo +3"
        obj.isShield = true
        obj.price = 9000
        
      elseif a > 40 and a < 51 then
        
        obj.type_ = "Armadura +3"
        obj.isShield = false
        obj.price = 9000
        
      elseif a > 50 and a < 56 then
        
        obj.type_ = "Escudo +4"
        obj.isShield = true
        obj.price = 16000
        
      elseif a > 55 and a < 58 then
        
        obj.type_ = "Armadura +4"
        obj.price = 16000
       
      elseif a > 57 and a < 61 then
        
        obj.type_ = "Armadura especifica"
        
      elseif a > 60 and a < 64 then
        
        obj.type_ = "Escudo especifico"
        
      elseif a > 63 then
        
        obj.modQnt = obj.modQnt + 1
        
        typeroll = true
        
      end
      
    elseif level >= 3 then
      
      if a > 0 and a < 9 then
        
        obj.type_ = "Escudo +3"
        obj.isShield = true
        obj.price = 9000
        
      elseif a > 8 and a < 17 then
        
        obj.type_ = "Armadura +3"
        obj.price = 9000
        
      elseif a > 16 and a < 28 then
        
        obj.type_ = "Escudo +4"
        obj.isShield = true
        obj.price = 16000
        
      elseif a > 27 and a < 39 then
        
        obj.type_ = "Armadura +4"
        obj.price = 16000
        
      elseif a > 38 and a < 50 then
        
        obj.type_ = "Escudo +5"
        obj.isShield = true
        obj.price = 25000
        
      elseif a > 49 and a < 58 then
        
        obj.type_ = "Armadura +5"
        obj.price = 25000
       
      elseif a > 57 and a < 61 then
        
        obj.type_ = "Armadura especifica"
        
      elseif a > 60 and a < 64 then
        
        obj.type_ = "Escudo especifico"
        
      elseif a > 63 then
        
        obj.modQnt = obj.modQnt + 1
        
        typeroll = true
        
      end
      
    end
    
    a = rand(1,100,rand(-444,231,rand(-85,97,42)))
    
  end
  
  local effects
  
  local fxQnt = 0
  
  if obj.isShield then
    effects = info.effects.shield[level]
    fxQnt = info.effects.shield[level].qnt
  else
    effects = info.effects.armor[level]
    fxQnt = info.effects.armor[level].qnt
  end
	
	if obj.modQnt >= fxQnt then 
		
		obj.mods = effects
		
	else
		
		while obj.modQnt > 0 do
			
			local a = rand(1, fxQnt, rand(-124,535,69))
      
      if a < 100 then
        
        table.insert(obj.mods, effects[a])
        table.remove(effects, a)
        
        obj.modQnt = obj.modQnt -1
        
      else
        
        obj.modQnt = obj.modQnt + 2
        
      end
      
		end
		
	end
  
  local b = rand(1,100,rand(-255,255,rand(-215,686,12)))
  
  if not obj.isShield then
    
    obj.name = info.armors[b][1]
    obj.price = obj.price + info.armors[b][2]
    for i,v in pairs(obj.mods) do
      for i1 in pairs(v) do
        obj.price = obj.price + v[2]
      end
    end
    
  else
    
    obj.name = info.shields[b][1]
    obj.price = obj.price + info.shields[b][2]
    
    for i,v in pairs(obj.mods) do
      for i1 in pairs(v) do
        obj.price = obj.price + v[2]
      end
    end
    
  end
  
  return obj
  
end


return gen