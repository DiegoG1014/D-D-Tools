local gen = {}

local info = {cuerpo={},exotico={},rango={},effects={cuerpo={{},{},{}},rango={{},{},{}}},specific={{},{},{}}}

info.cuerpo[3] = {"Bastón",600,false}
info.cuerpo[8] = {"Cimitarra",315,false}
info.cuerpo[12]= {"Daga",302,false}
info.cuerpo[22]= {"Espada Bastarda",335,false}
info.cuerpo[27]= {"Espada corta",310,false}
info.cuerpo[40]= {"Espada larga",315,false}
info.cuerpo[50]= {"Espadón",350,false}
info.cuerpo[54]= {"Estoque",320,false}
info.cuerpo[64]= {"Gran Hacha",320,false}
info.cuerpo[75]= {"Hacha de guerra enana",330,false}
info.cuerpo[79]= {"Kama",302,false}
info.cuerpo[83]= {"Lanza corta",302,false}
info.cuerpo[87]= {"Maza ligera",305,false}
info.cuerpo[92]= {"Maza pesada",312,false}
info.cuerpo[96]= {"Nunchaku",302,false}
info.cuerpo[100]= {"Siangham",303,false}

info.exotico[3] = {"Alabarda",310,false}
info.exotico[5] = {"Alfanjón",375,false}
info.exotico[9] = {"Ballesta de mano",400,true}
info.exotico[12]= {"Ballesta de repetición",550,true}
info.exotico[14]= {"Bisarma",309,false}
info.exotico[16]= {"Cachiporra",301,false}
info.exotico[19]= {"Cadena armada",325,false}
info.exotico[21]= {"Clava",300,false}
info.exotico[24]= {"Espada de dos hojas",700,false}
info.exotico[26]= {"Gran clava",305,false}
info.exotico[28]= {"Guadaña",318,false}
info.exotico[30]= {"Guantelete",302,false}
info.exotico[32]= {"Guantelete armado",305,false}
info.exotico[34]= {"Guja",308,false}
info.exotico[38]= {"Hacha de batalla",310,false}
info.exotico[40]= {"Hacha de mano",306,false}
info.exotico[43]= {"Hacha de doble orca",660,false}
info.exotico[45]= {"Hoz",306,false}
info.exotico[48]= {"Kukri",308,false}
info.exotico[50]= {"Lanza larga",305,false}
info.exotico[52]= {"Lanza ligera de caballería",306,false}
info.exotico[54]= {"Lanza pesada de caballería",310,false}
info.exotico[57]= {"Látigo",301,false}
info.exotico[60]= {"Mangual doble",690,false}
info.exotico[64]= {"Mangual ligero",308,false}
info.exotico[69]= {"Mangual pesado",315,false}
info.exotico[72]= {"Martillo de guerra",312,false}
info.exotico[75]= {"Martillo ganchudo gnomo",620,false}
info.exotico[77]= {"Martillo ligero",301,false}
info.exotico[80]= {"Maza de armas",308,false}
info.exotico[83]= {"Media lanza",301,false}
info.exotico[85]= {"Pico ligero",304,false}
info.exotico[87]= {"Pico pesado",308,false}
info.exotico[89]= {"Puñal",302,false}
info.exotico[91]= {"Red",320,true}
info.exotico[93]= {"Ronca",310,false}
info.exotico[95]= {"Shuriken",301,true}
info.exotico[97]= {"Tridente",315,false}
info.exotico[100]= {"Urgrosh enano",650,false}

info.rango[10]= {"Municíon",350,true}
info.rango[15]= {"Hacha arrojadiza",308,true}
info.rango[25]= {"Ballesta pesada",350,true}
info.rango[35]= {"Ballesta ligera",335,true}
info.rango[39]= {"Dardo (50)",300,true}
info.rango[41]= {"Jabalina",301,true}
info.rango[46]= {"Arco corto",330,true}
info.rango[51]= {"Arco corto compuesto",375,true}
info.rango[56]= {"Arco corto compuesto (Fue +1)",450,true}
info.rango[61]= {"Arco corto compuesto (Fue +2)",525,true}
info.rango[65]= {"Honda",300,true}
info.rango[75]= {"Arco largo",375,true}
info.rango[80]= {"Arco largo compuesto",400,true}
info.rango[85]= {"Arco largo compuesto (Fue +1)",500,true}
info.rango[90]= {"Arco largo compuesto (Fue +2)",600,true}
info.rango[95]= {"Arco largo compuesto (Fue +3)",700,true}
info.rango[100]= {"Arco largo compuesto (Fue +4)",800,true}

info.effects.cuerpo[1][10]= {"Azote",100}
info.effects.cuerpo[1][17]= {"Defensora",100}
info.effects.cuerpo[1][27]= {"Flamígera",100}
info.effects.cuerpo[1][37]= {"Congeladora",100}
info.effects.cuerpo[1][47]= {"Electrizante",100}
info.effects.cuerpo[1][56]= {"Fantasmal",100}
info.effects.cuerpo[1][67]= {"Afilada",100}
info.effects.cuerpo[1][71]= {"Canalizadora de ki",100}
info.effects.cuerpo[1][75]= {"Compasiva",100}
info.effects.cuerpo[1][82]= {"Hendiente",100}
info.effects.cuerpo[1][87]= {"Almacenaconjuros",100}
info.effects.cuerpo[1][91]= {"Arrojadiza",100}
info.effects.cuerpo[1][95]= {"Tronante",100}
info.effects.cuerpo[1][99]= {"Viciosa",100}

info.effects.cuerpo[2][6] = {"Azote",100}
info.effects.cuerpo[2][12]= {"Defensora",100}
info.effects.cuerpo[2][19]= {"Flamígera",100}
info.effects.cuerpo[2][26]= {"Congeladora",100}
info.effects.cuerpo[2][33]= {"Electrizante",100}
info.effects.cuerpo[2][38]= {"Fantasmal",100}
info.effects.cuerpo[2][44]= {"Afilada",100}
info.effects.cuerpo[2][48]= {"Canalizadora de ki",100}
info.effects.cuerpo[2][50]= {"Compasiva",100}
info.effects.cuerpo[2][54]= {"Hendiente",100}
info.effects.cuerpo[2][59]= {"Almacenaconjuros",100}
info.effects.cuerpo[2][63]= {"Arrojadiza",100}
info.effects.cuerpo[2][65]= {"Tronante",100}
info.effects.cuerpo[2][69]= {"Viciosa",100}
info.effects.cuerpo[2][72]= {"Anárquica",200}
info.effects.cuerpo[2][75]= {"Axiomática",200}
info.effects.cuerpo[2][78]= {"Disruptora",200}
info.effects.cuerpo[2][81]= {"Explosiva ígnea",200}
info.effects.cuerpo[2][84]= {"Explosiva gélida",200}
info.effects.cuerpo[2][87]= {"Sagrada",200}
info.effects.cuerpo[2][90]= {"Explosiva eléctrica",200}
info.effects.cuerpo[2][93]= {"Sacrílega",200}
info.effects.cuerpo[2][95]= {"Hiriente",200}

info.effects.cuerpo[3][3] = {"Azote",100}
info.effects.cuerpo[3][6] = {"Flamígera",100}
info.effects.cuerpo[3][9] = {"Congeladora",100}
info.effects.cuerpo[3][12]= {"Electrizante",100}
info.effects.cuerpo[3][15]= {"Fantasmal",100}
info.effects.cuerpo[3][19]= {"Canalizadora de ki",100}
info.effects.cuerpo[3][21]= {"Hendiente",100}
info.effects.cuerpo[3][24]= {"Almacenaconjuros",100}
info.effects.cuerpo[3][28]= {"Arrojadiza",100}
info.effects.cuerpo[3][32]= {"Tronante",100}
info.effects.cuerpo[3][36]= {"Viciosa",100}
info.effects.cuerpo[3][41]= {"Anárquica",200}
info.effects.cuerpo[3][46]= {"Axiomática",200}
info.effects.cuerpo[3][49]= {"Disruptora",200}
info.effects.cuerpo[3][54]= {"Explosiva ígnea",200}
info.effects.cuerpo[3][59]= {"Explosiva gélida",200}
info.effects.cuerpo[3][64]= {"Sagrada",200}
info.effects.cuerpo[3][69]= {"Explosiva eléctrica",200}
info.effects.cuerpo[3][74]= {"Sacrílega",200}
info.effects.cuerpo[3][78]= {"Hiriente",200}
info.effects.cuerpo[3][83]= {"Veloz",300}
info.effects.cuerpo[3][86]= {"Radiante",400}
info.effects.cuerpo[3][88]= {"Danzante",400}
info.effects.cuerpo[3][90]= {"Vorpalina",500}

info.effects.rango[1][12]= {"Azote",100}
info.effects.rango[1][25]= {"Distante",100}
info.effects.rango[1][40]= {"Flamígera",100}
info.effects.rango[1][55]= {"Congeladora",100}
info.effects.rango[1][60]= {"Compasiva",100}
info.effects.rango[1][68]= {"Retornante",100}
info.effects.rango[1][83]= {"Electrizante",100}
info.effects.rango[1][93]= {"Buscadora",100}
info.effects.rango[1][99]= {"Tronante",100}

info.effects.rango[2][8] = {"Azote",100}
info.effects.rango[2][16]= {"Distante",100}
info.effects.rango[2][28]= {"Flamígera",100}
info.effects.rango[2][40]= {"Congeladora",100}
info.effects.rango[2][42]= {"Compasiva",100}
info.effects.rango[2][47]= {"Retornante",100}
info.effects.rango[2][59]= {"Electrizante",100}
info.effects.rango[2][64]= {"Buscadora",100}
info.effects.rango[2][68]= {"Tronante",100}
info.effects.rango[2][71]= {"Anárquica",200}
info.effects.rango[2][74]= {"Axiomática",200}
info.effects.rango[2][79]= {"Explosiva ígnea",200}
info.effects.rango[2][82]= {"Sagrada",200}
info.effects.rango[2][87]= {"Explosiva gélida",200}
info.effects.rango[2][92]= {"Explosiva eléctrica",200}
info.effects.rango[2][95]= {"Sacrílega",200}

info.effects.rango[3][4] = {"Azote",100}
info.effects.rango[3][8] = {"Distante",100}
info.effects.rango[3][12]= {"Flamígera",100}
info.effects.rango[3][16]= {"Congeladora",100}
info.effects.rango[3][21]= {"Retornante",100}
info.effects.rango[3][25]= {"Electrizante",100}
info.effects.rango[3][27]= {"Buscadora",100}
info.effects.rango[3][29]= {"Tronante",100}
info.effects.rango[3][34]= {"Anárquica",200}
info.effects.rango[3][39]= {"Axiomática",200}
info.effects.rango[3][49]= {"Explosiva ígnea",200}
info.effects.rango[3][54]= {"Sagrada",200}
info.effects.rango[3][64]= {"Explosiva gélida",200}
info.effects.rango[3][74]= {"Explosiva eléctrica",200}
info.effects.rango[3][79]= {"Sacrílega",200}
info.effects.rango[3][84]= {"Veloz",300}
info.effects.rango[3][90]= {"Radiante",400}

info.specific[1][15] = {price = 132, wName = "Flecha adormecedora"}
info.specific[1][25] = {price = 297, wName = "Virote aullante"}
info.specific[1][45] = {price = 322, wName = "Daga de plata de gran calidad"}
info.specific[1][65] = {price = 330, wName = "Espada larga de hierro frío de gran calidad"}
info.specific[1][75] = {price = 1500, wName = "Jabalina del relámpago"}
info.specific[1][80] = {price = 2282, wName = "Flecha asesina"}
info.specific[1][90] = {price = 3002, wName = "Daga adamantita"}
info.specific[1][100]= {price = 3010, wName = "Hacha de batalla adamantita"}

info.specific[2][9]  = {price = 1500, wName = "Jabalina del relámpago"}
info.specific[2][15] = {price = 2282, wName = "Flecha asesina"}
info.specific[2][24] = {price = 3002, wName = "Daga adamantita"}
info.specific[2][33] = {price = 3010, wName = "Hacha de batalla adamantita"}
info.specific[2][37] = {price = 4057, wName = "Flecha asesina (mayor)"}
info.specific[2][40] = {price = 4315, wName = "Rompedora"}
info.specific[2][46] = {price = 8302, wName = "Daga de ponzoña"}
info.specific[2][51] = {price = 10115, wName = "Tridente avisador"}
info.specific[2][57] = {price = 10302, wName = "Daga del asesino"}
info.specific[2][62] = {price = 12780, wName = "Tormento de cambiantes"}
info.specific[2][66] = {price = 18650, wName = "Tridente de comandar peces"}
info.specific[2][74] = {price = 20715, wName = "Lengua flamígera"}
info.specific[2][79] = {price = 22060, wName = "Hoja de la suerte (0 deseos)"}
info.specific[2][86] = {price = 22310, wName = "Espada de sutileza"}
info.specific[2][91] = {price = 22315, wName = "Espada de los Planos"}
info.specific[2][95] = {price = 23057, wName = "Robadora de nueve vidas"}
info.specific[2][98] = {price = 25715, wName = "Espada arrebatavidas"}
info.specific[2][100]= {price = 25600, wName = "Arco juramentado"}

info.specific[3][4]  = {price = 10302, wName = "Daga del asesino"}
info.specific[3][7]  = {price = 12780, wName = "Tormento de cambiantes"}
info.specific[3][9]  = {price = 18650, wName = "Tridente de comandar peces"}
info.specific[3][13] = {price = 20715, wName = "Lengua flamígera"}
info.specific[3][17] = {price = 22060, wName = "Hoja de la suerte (0 deseos)"}
info.specific[3][24] = {price = 22310, wName = "Espada de sutileza"}
info.specific[3][31] = {price = 22315, wName = "Espada de los Planos"}
info.specific[3][37] = {price = 23057, wName = "Robadora de nueve vidas"}
info.specific[3][42] = {price = 25715, wName = "Espada arrebatavidas"}
info.specific[3][46] = {price = 25600, wName = "Arco juramentado"}
info.specific[3][51] = {price = 38552, wName = "Maza del terror"}
info.specific[3][57] = {price = 40320, wName = "Bebedora de vidas"}
info.specific[3][62] = {price = 47315, wName = "Cimitarra de los bosques"}
info.specific[3][67] = {price = 50320, wName = "Estoque punzante"}
info.specific[3][73] = {price = 50335, wName = "Hoja solar"}
info.specific[3][79] = {price = 54475, wName = "Hierro de escarcha"}
info.specific[3][84] = {price = 60312, wName = "Martillo arrojadizo de los enanos"}
info.specific[3][91] = {price = 62360, wName = "Hoja de la suerte (1 deseo)"}
info.specific[3][95] = {price = 75312, wName = "Maza del castigo"}
info.specific[3][97] = {price = 102660, wName = "Hoja de la suerte (2 deseos)"}
info.specific[3][99] = {price = 120630, wName = "Vengadora sagrada"}
info.specific[3][100]= {price = 142960, wName = "Hoja de la suerte (3 deseos)"}
  
if true then
  
  local ind, cv = 100, "extra"
  
  while ind > 0 do
    
    if info.cuerpo[ind] then
      cv = info.cuerpo[ind]
    else
      info.cuerpo[ind] = cv
    end
    
    ind = ind -1
    
  end
  
  ind, cv = 100, "extra"
  
  while ind > 0 do
    
    if info.exotico[ind] then
      cv = info.exotico[ind]
    else
      info.exotico[ind] = cv
    end
    
    ind = ind -1
    
  end
  
  ind, cv = 100, "extra"
  
  while ind > 0 do
    
    if info.rango[ind] then
      cv = info.rango[ind]
    else
      info.rango[ind] = cv
    end
    
    ind = ind -1
    
  end
  
  ind, cv = 100, nil
  
  local levels = 3
  
  while levels > 0 do
    
    while ind > 0 do
      
      if info.effects.cuerpo[levels][ind] then
        cv = info.effects.cuerpo[levels][ind]
      else
        info.effects.cuerpo[levels][ind] = cv
      end
      
      ind = ind -1
      
    end
    
    levels = levels -1
    ind = 100
    
  end
  
  ind, cv, levels = 100, nil, 3
  
  while levels > 0 do
    
    while ind > 0 do
      
      if info.effects.rango[levels][ind] then
        cv = info.effects.rango[levels][ind]
      else
        info.effects.rango[levels][ind] = cv
      end
      
      ind = ind -1
      
    end
    
    levels = levels -1
    ind = 100
    
  end
  
end

function gen.generate(level)
	
	local modRoll = true
	
	local selector = {
		
		weaponType = math.random(1,100,math.random(-69,69,math.random(1,25,69))),
		modifier = nil,
		weapon = math.random(1,100,math.random(-125,634,math.random(-1256,6747,255)))
		
	}
	
	local weaponType, price
	
	local weapon = {
		
		wType = 0,
		price = 0,
		modQnt = 0,
    dmg = 0,
		mods = {},
		wName = ""
		
	}
	
	if selector.weaponType >= 1 and selector.weaponType <= 70 then
		weapon.wType = "cuerpo"
	elseif selector.weaponType >= 71 and selector.weaponType <= 80 then
		weapon.wType = "rango"
	elseif selector.weaponType >= 81 and selector.weaponType <= 100 then
		weapon.wType = "exotico"
	end
	
	repeat
		
		selector.modifier = math.random(1,100,math.random(-125,125,math.random(4,86,131)))
		
		modRoll = false
		
		if level == 1 then
			
			if selector.modifier >= 1 and selector.modifier <= 70 then
				
				weapon.dmg = 1
				weapon.price = weapon.price + 2000
				
			elseif selector.modifier >= 71 and selector.modifier <= 85 then
				
				weapon.dmg = 2
				weapon.price = weapon.price + 8000
				
			elseif selector.modifier >= 86 and selector.modifier <= 90 then
				
        local a = math.random(1,100,math.random(-421,332,math.random(-58,564,69)))
				weapon = info.specific[1][a]
				return weapon
				
			elseif selector.modifier >= 91 then
				
				weapon.modQnt = weapon.modQnt + 1
				modRoll = true
				
			end
			
		elseif level == 2 then
			
			if selector.modifier >= 1 and selector.modifier <= 10 then
				
				weapon.dmg = 1
				weapon.price = weapon.price + 2000
				
			elseif selector.modifier >= 11 and selector.modifier <= 20 then
				
				weapon.dmg = 2
				weapon.price = weapon.price + 8000
				
			elseif selector.modifier >= 21 and selector.modifier <= 58 then
				
				weapon.dmg = 3
				weapon.price = weapon.price + 18000
				
			elseif selector.modifier >= 59 and selector.modifier <= 62 then
				
				weapon.dmg = 4
				weapon.price = weapon.price + 32000
				
			elseif selector.modifier >= 63 and selector.modifier <= 68 then
				
				local a = math.random(1,100,math.random(-421,332,math.random(-58,564,69)))
				weapon = info.specific[2][a]
				return weapon
				
			elseif selector.modifier >= 69 then
				
				weapon.modQnt = weapon.modQnt + 1
				modRoll = true
				
			end
			
		elseif level == 3 then
			
			if selector.modifier >= 1 and selector.modifier <= 20 then
				
				weapon.dmg = 3
				weapon.price = weapon.price + 18000
				
			elseif selector.modifier >= 21 and selector.modifier <= 38 then
				
				weapon.dmg = 4
				weapon.price = weapon.price + 32000
				
			elseif selector.modifier >= 39 and selector.modifier <= 49 then
				
				weapon.dmg = 5
				weapon.price = weapon.price + 50000
				
			elseif selector.modifier >= 50 and selector.modifier <= 63 then
				
				local a = math.random(1,100,math.random(-421,332,math.random(-58,564,69)))
				weapon = info.specific[3][a]
				return weapon
				
			elseif selector.modifier >= 64 then
				
				weapon.modQnt = weapon.modQnt + 1
				modRoll = true
				
			end
			
		end
		
	until not modRoll
  
  weapon.wName = info[weapon.wType][selector.weapon][1]
  weapon.price = weapon.price + info[weapon.wType][selector.weapon][2]
  weapon.isrango = info[weapon.wType][selector.weapon][3]
	
  local effects
  
  if weapon.isrango then
    effects = info.effects.rango[level]
  else
    effects = info.effects.cuerpo[level]
  end
  
  local fxQnt = 0
  
  for i,v in pairs(effects) do
    fxQnt = fxQnt +1
  end
	
	if weapon.modQnt >= fxQnt then 
		
		weapon.mods = effects
		
	else
		
		while weapon.modQnt > 0 do
			
			local a = math.random(1, fxQnt, math.random(-124,535,69))
      
      if a < 100 then
        
        table.insert(weapon.mods, effects[a])
        table.remove(effects, a)
        
        weapon.modQnt = weapon.modQnt -1
        
      else
        
        weapon.modQnt = weapon.modQnt + 2
        
      end
      
		end
		
	end
  
  for i,v in pairs(weapon.mods) do
    
    weapon.price = weapon.price + v[2]
    
  end
  
  weapon.modQnt = nil
	
	return weapon
	
end

return gen