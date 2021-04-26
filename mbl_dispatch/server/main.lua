ESX = nil
Characters = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function aiakosandmblfuckinggaylar(job)
    local players = {}
    for k, v in pairs(Characters) do
        if v.job.name == job then
            local result = exports.ghmattimysql:executeSync("SELECT firstname, lastname FROM users WHERE identifier = identifier", {
                ["identifier"] = v.identifier,
            })
            table.insert(players, {['cid'] = v.identifier, ['source'] = v.source(), ['name'] = result[1]})
        end
    end
    return players
end