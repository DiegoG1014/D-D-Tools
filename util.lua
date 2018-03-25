local ts = tostring
function tostring(...) --Replaces te default tostring function for one that can concatenate and print multiple values
  
  local a = {...}
  if #a <= 1 then
    
    return ts(a[1])
    
  else
    
    local b = ""
    
    for i,v in ipairs(a) do
      b = b.." "..ts(v)
    end
    
    return b
    
  end
  
end
lua_assert = assert
function assert(v,source,message)
  
  if not v then log.record(source, message, true) end
  
end

local ___type = type
function type(v)
  
  local t = ___type(v)
  
  if t == "userdata" then
    if t == "table" and t.type then
      return t:type()
    else
      return t
    end 
  else
    return t
  end
  
end

function strexplode(str,level)
  level = level or 1
  if level < 1 then level = 1 elseif level > 2 then level = 2 end
  if type(str) == "string" then
    local b = {}
    if level == 1 then
      for string in str:gmatch("%S+") do
        table.insert(b,string)
      end
      return b
    elseif level == 2 then
      for string in str:gmatch("%S") do
        table.insert(b,string)
      end
      return b
    end
  end
end

function setReadOnly(t)
  return setmetatable(
    {},
    {
      __index = t,
      __newindex = function(t,k,v)
        log.record("Lua","Attempt to update a read-only table", true, 2)
      end,
      __metatable = nil
    }
  )
end

local strformat = string.format
function string.format(format, ...)
  local args = {...}
  local match_no = 1
  for pos, type in string.gmatch(format, "()%%.-(%a)") do
    if type == 't' then
      args[match_no] = tostring(args[match_no])
    end
    match_no = match_no + 1
  end
  return strformat(string.gsub(format, '%%t', '%%s'),
         unpack(args,1,select('#',...)))
end

local tn = tonumber
function tonumber(...)
  
  local str = {...}
  local num = {}
  
  if #str < 1 then return nil end
  
  for i,v in ipairs(str) do
    
    table.insert(num, tn(v))
    
  end
  
  return unpack(num)

end

function table.write(t,mode)
  
  local dat,content,index,closure = nil, 0,0
  if not mode then
    dat = "local t={"
    closure = "} return t"
  else
    dat = "{"
    closure = "}"
  end
  
  for i,v in pairs(t) do
    content = content + 1
  end
  
  for i,v in pairs(t) do
    index = index +1
    if type(i) == "number" then
      if type(v) == "table" then
        if index < content then
          dat = dat .. table.write(v,true) .. ","
        else
          dat = dat .. table.write(v,true)
        end
      elseif type(v) == "string" then
        if index < content then
          dat = dat .. "\""..v.."\"" .. ","
        else
          dat = dat .. "\""..v.."\""
        end
      else
        if index < content then
          dat = dat .. tostring(v) .. ","
        else
          dat = dat .. tostring(v)
        end
      end
    else
      if type(v) == "table" then
        if index < content then
          dat = dat .. i .. "=" .. table.write(v,true) .. ","
        else
          dat = dat .. i .. "=" .. table.write(v,true)
        end
      elseif type(v) == "string" then
        if index < content then
          dat = dat .. i .. "=" .. "\"" .. v .. "\"" .. ","
        else
          dat = dat .. i .. "=" .. "\"" .. v .. "\""
        end
      else
        if index < content then
          dat = dat .. i .. "=" .. tostring(v) .. ","
        else
          dat = dat .. i .. "=" .. tostring(v)
        end
      end
    end
  end
  
  return dat..closure
  
end