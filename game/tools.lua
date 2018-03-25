local info = {
  
  dice = {
    
    [2] = function()
      
      return math.random(1,2)
      
    end,
    
    [3] = function()
      
      return math.random(1,3)
      
    end,
    
    [4] = function()
      
      return math.random(1,4)
      
    end,
    
    [5] = function()
      
      return math.random(1,5)
      
    end,
    
    [6] = function()
      
      return math.random(1,6)
      
    end,
    
    [7] = function()
      
      return math.random(1,7)
      
    end,
    
    [8] = function()
      
      return math.random(1,8)
      
    end,
    
    [10] = function()
      
      return math.random(1,10)
      
    end,
    
    [12] = function()
      
      return math.random(1,12)
      
    end,
    
    [14] = function()
      
      return math.random(1,14)
      
    end,
    
    [16] = function()
      
      return math.random(1,16)
      
    end,
    
    [20] = function()
      
      return math.random(1,20)
      
    end,
    
    [24] = function()
      
      return math.random(1,24)
      
    end,
    
    [30] = function()
      
      return math.random(1,30)
      
    end,
    
    [100] = function()
      
      return math.random(1,100)
      
    end
    
  }
  
}

local tools = {
  
  roll = function(loop,dice,amount)
    
    local a = {}
    
    for i=1,loop do
      table.insert(a,info.dice[dice]())
    end
    
    return a
    
  end
  
}
  
return tools