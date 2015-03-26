function split(str, reps)
    local resultStrsList = {};
    string.gsub(str, '[^'..reps..']+', function(w) table.insert(resultStrsList, w) end );
    return resultStrsList;
end

function loadCsvFile(filePath)
    -- 读取文件
    local data = cc.FileUtils:getInstance():getStringFromFile(filePath);
    -- 按行划分
    local lineStr = split(data, '\r\n');
    --[[
    用二维TABLE保存：arr[第一列][属性标题字符串]
    ]]
    local titles
    for i = 1, #lineStr, 1 do
        local t = string.find(lineStr[i], "\/\/");
        if string.find(lineStr[i], "\/\/") == nil then
            titles = split(lineStr[i], ",");
            table.remove(lineStr,i)
            break;
        end
    end

    local arrs = {};
    for i = 1, #lineStr, 1 do
        if  string.find(lineStr[i], "\/\/") == nil then
            -- 一行中，每一列的内容
            local content = split(lineStr[i], ",");
            -- 以第一列作为索引，保存每一列的内容，取值的时候这样取：arrs[第一列].Name
            arrs[content[1]] = {};
            for j = 1, #titles, 1 do
                arrs[content[1]][titles[j]] = content[j];
            end
        end
    end
    return arrs;
end