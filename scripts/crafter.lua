-------------------------------------------------------------------------------
--[Picker Crafter]-- Craft selected entity on hotkey press
-------------------------------------------------------------------------------
local Event = require('stdlib/event/event')
local lib = require('scripts/lib')

local function picker_crafter(event)
    local player = game.players[event.player_index]
    if player.selected and not player.cursor_stack.valid_for_read then
        local multiple_enabled = player.mod_settings['picker-allow-multiple-craft'].value
        local _, _, ip = lib.get_placeable_item(player.selected)
        if ip and game.recipe_prototypes[ip.name] and player.force.recipes[ip.name].enabled and (multiple_enabled or player.get_item_count(ip.name) == 0) then
            player.begin_crafting {count = 1, recipe = ip.name, silent = false}
        end
    end
end
Event.register('picker-crafter', picker_crafter)
