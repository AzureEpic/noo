local HTTP = {}


local requestFunc = syn and syn.request
    or http and http.request
    or http_request
    or fluxus and fluxus.request
    or request 

if not requestFunc then
    error("nil")
end


function HTTP:Get(url)
    local response = requestFunc({
        Url = url,
        Method = "GET"
    })

    return response.Body or response.body or response 
end





function HTTP:Loadstring(url)
    local source = self:Get(url)
    return loadstring(source)()
end




function HTTP:GetTable(url)
    local result = self:Loadstring(url)

    if typeof(result) ~= "table" then
        print("result isnt a table")
        return {}
    end

    return result
end

return HTTP
