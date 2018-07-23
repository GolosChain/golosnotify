function update_actions(account, type, date)
    local space = box.space.actions
    local res = space:select{account}
    if #res > 0 then
        local actions = res[1][2]
        actions[type] = date
        -- print('update_actions -->', account, type, actions[type])
        space:update(account, {{'=', 2, actions}})
    else
        if type == 'login' then
            local actions = {
                login = date,
                vote = 0,
                flag = 0,
                post = 0,
                comment = 0,
                transfer = 0,
                market = 0
            }
            space:insert({account, actions})
        end
    end
end
