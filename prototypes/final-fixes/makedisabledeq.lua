-- This part mostly borrowed from equipment hotkeys by articulating which was mostly borrowed from personal-roboport-switch by mknejp

if not data.raw["custom-input"]["equipment-toggle-personal-roboport"] then
    local equipment = { }
    for _, v in pairs(data.raw["roboport-equipment"]) do
        local t = table.deepcopy(v)
        -- Keep the same localised name if none is specified
        t.localised_name = {"equipment-hotkeys.disabled-eq", t.localised_name or {"equipment-name."..t.name}}
        -- Some mods don't specify take_result making it default to the equipment name.
        -- If we don't set it the game is going to look for an item with the wrong name.
        t.take_result = t.take_result or t.name
        t.name = "picker-disabled-" .. t.name
        t.construction_radius = 0
        t.robot_limit = 0
        equipment[#equipment + 1] = t
    end
    for _, v in pairs(data.raw["movement-bonus-equipment"]) do
        local t = table.deepcopy(v)
        -- Keep the same localised name if none is specified
        t.localised_name = {"equipment-hotkeys.disabled-eq", t.localised_name or {"equipment-name."..t.name}}
        -- Some mods don't specify take_result making it default to the equipment name.
        -- If we don't set it the game is going to look for an item with the wrong name.
        t.take_result = t.take_result or t.name
        t.name = "picker-disabled-" .. t.name
        t.energy_consumption = "1kW"
        t.movement_bonus = 0
        equipment[#equipment + 1] = t
    end
    for _, v in pairs(data.raw["night-vision-equipment"]) do
        local t = table.deepcopy(v)
        -- Keep the same localised name if none is specified
        t.localised_name = {"equipment-hotkeys.disabled-eq", t.localised_name or {"equipment-name."..t.name}}
        -- Some mods don't specify take_result making it default to the equipment name.
        -- If we don't set it the game is going to look for an item with the wrong name.
        t.take_result = t.take_result or t.name
        t.name = "picker-disabled-" .. t.name
        t.energy_input = "0kW"
        equipment[#equipment + 1] = t
    end
    for _, v in pairs(data.raw["belt-immunity-equipment"]) do
        local t = table.deepcopy(v)
        -- Keep the same localised name if none is specified
        t.localised_name = {"equipment-hotkeys.disabled-eq", t.localised_name or {"equipment-name."..t.name}}
        -- Some mods don't specify take_result making it default to the equipment name.
        -- If we don't set it the game is going to look for an item with the wrong name.
        t.take_result = t.take_result or t.name
        t.name = "picker-disabled-" .. t.name
        t.energy_input = "0kW"
        --buffer_capacity = "100kJ",
        t.energy_source = {
            type = "electric",
            buffer_capacity = "0kJ",
            input_flow_limit = "0kW",
            drain = "0W",
            usage_priority = "terciary"
        }
        equipment[#equipment + 1] = t
    end
    data:extend(equipment)
end
