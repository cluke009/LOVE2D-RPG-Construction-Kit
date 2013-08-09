-- 
-- Class: table
-- Table helpers
-- 

-- 
-- Method: keys
-- Return a table of t's keys.
-- 
function table.keys(t)
    local keys = {}
    table.foreach(t, function(k,v) keys[#keys+1] = k end) 
    return keys
end

-- 
-- Method: first
-- Return the first key/element in a table.
-- 
function table.first(t)
    for k,v in pairs(t) do
        return k,v
    end
end

-- 
-- Method: first
-- Like table.insert(), but won't fail if `t` isn't already
-- initialized. If it isn't, it will be initialized.
-- 
function table.add(t, el)
    local t = t or {}
    table.insert(t, el)
    return t
end

-- 
-- Method: merge
-- Combine contents of t2 into t1, overwriting keys if necessary.
-- 
function table.merge(t1, t2)
    for k,v in pairs(t2) do t1[k] = v end
    return t1
end

-- 
-- Method: append
-- Append the contents of t2 into t1. Useful for arrays.
-- 
function table.append(t1, t2)
    for i,v in ipairs(t2) do t1[#t1+1] = v end
    return t1
end

-- 
-- Method: slice
-- Return a subset of an array (ie, a numerically-indexed table).
-- The resulting table will include elements starting at 'pos'
-- in table 't', containing a maximum of 'len' elements.
-- 
function table.slice(t, pos, len)
    local idx = pos
    local t2 = {}
    for i=1,len do
        table.insert(t2, t[idx])
        idx = idx + 1
        if idx > #t then break end
    end
    return t2
end

-- 
-- Method: pluck
-- Return an array consisting of a specific element from each
-- sub-table within table `t`.
-- 
function table.pluck(t, key)
    local t2 = {}
    for _,v in pairs(t) do
        table.insert(t2, v[key])
    end
    return t2
end

-- 
-- Method: has
-- See if an element exists in a table.
-- 
function table.has(t, el)
    for _,v in pairs(t) do
        if v == el then return true end
    end
    return false
end

-- 
-- Method: copy
-- Perform a (optionally) deep copy on the source table `t`.
-- 
function table.copy(t, deep, seen)
    seen = seen or {}
    if t == nil then return nil end
    if seen[t] then return seen[t] end

    local nt = {}
    for k, v in pairs(t) do
        if deep and type(v) == 'table' then
            nt[k] = table.copy(v, deep, seen)
        else
            nt[k] = v
        end
    end
    setmetatable(nt, table.copy(getmetatable(t), deep, seen))
    seen[t] = nt
    return nt
end

-- 
-- Method: extend
-- Copy a table t and extend it with different/new values from t2.
-- 
function table.extend(t, t2)
    local nt = table.copy(t)
    if t2 then
        if t2[1] then
            for _,v in ipairs(t2) do table.insert(nt, v) end
        else
            for k,v in pairs(t2) do nt[k] = v end
        end
    end
    return nt
end

-- 
-- Method: map
-- 
-- Call the callback `fn` with each element in `t` as the first
-- argument, and use these result to form a new result table.
-- 
function table.map(t, fn)
    local res = {}
    if t[1] then
        for _,v in ipairs(t) do table.insert(res, fn(v)) end
    else
        for k,v in pairs(t) do res[k] = fn(v) end
    end
    return res
end

-- 
-- Method: print
-- Dump a variable in a human-readable format (useful for tables).
-- Return the dumped data as a string.
-- 
function table_print(tt, indent, done)
    done = done or {}
    indent = indent or 0
    if type(tt) == "table" then
        for key, value in pairs (tt) do
            io.write(string.rep (" ", indent)) -- indent it
            if type (value) == "table" and not done [value] then
                done [value] = true
                io.write(string.format("[%s] => table\n", tostring (key)));
                io.write(string.rep (" ", indent+4)) -- indent it
                io.write("(\n");
                table_print(value, indent + 7, done)
                io.write(string.rep (" ", indent+4)) -- indent it
                io.write(")\n");
            else
                io.write(string.format("[%s] => %s\n",
                tostring (key), tostring(value)))
            end
        end
    else
        io.write(tt .. "\n")
    end
end
