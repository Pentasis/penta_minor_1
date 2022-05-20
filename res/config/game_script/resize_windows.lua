function data()
    return {
        guiInit = function()
            for _, id in pairs({
                "menu.construction.road.settingsWindow",
                "menu.construction.rail.settingsWindow",
                "menu.construction.water.settingsWindow",
                "menu.construction.air.settingsWindow",
                "menu.construction.terrain.settingsWindow",
                "menu.construction.town.settingsWindow",
                "menu.construction.industry.settingsWindow",
                "menu.modules.settingsWindow",
            }) do
                local c = api.gui.util.getById(id)
                if c then
                    c:setResizable(true)
                    c:setIcon("ui/hammer19.tga")
                end
            end
        end,
        guiHandleEvent = function(id, name, param)
            if name == "idAdded" and id:match("temp.view.entity_%d") then
                local entstr = id:gsub("temp.view.entity_", "")
                local ent = tonumber(entstr)
                local StWidth = 450 -- New station window width - Still beta
                local StHeight = 750 -- New station window height - Still beta
                if not ent then
                    print(id, "No entity!")
                else
                    if api.engine.getComponent(ent, 70) or api.engine.getComponent(ent, 46) or api.engine.getComponent(ent, 27) or api.engine.getComponent(ent, 28) or api.engine.getComponent(ent, 49) or api.engine.getComponent(ent, 65) or api.engine.getComponent(ent, 60) then
                        local stWindow = api.gui.util.downcast(api.gui.util.getById(id))
                        if stWindow then
                            stWindow:setResizable(true)
                            stWindow:setIcon("ui/hammer19.tga")
                            -- remove the " -- " from the line below to make all the windows bigger by default. Appling different default size for different windows will be made available in future versions
                            --stWindow:setSize(api.gui.util.Size.new(StWidth,StHeight))
                        end
                    end
                end
            end
        end
    }
end
