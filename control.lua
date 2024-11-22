local sounds = {
    "bot_death_sound_1.ogg",
    "bot_death_sound_2.ogg",
}
-- Pick Random Sound
local function play_random_sound()
    local index = math.random(#sounds)
    local sound_name = sounds[index]
    game.play_sound{path = sound_name, volume_modifier=1.0}
end

--Bot Death
script.on_event(defines.events.on_entity_died, function(event)
local MAX_DISTANCE = 50 
    for _, player in pairs(game.players) do
        if player.connected and player.character and player.character.valid and player.character.logistic_network then
            for _, bot in pairs(player.character.logistic_network.robots) do 
                local distance = ((event.entity.position.x - player.position.x) ^ 2 + (event.entity.position.y - player.position.y) ^ 2) ^ 0.5
                if bot.unit_number == event.entity.unit_number and distance <= MAX_DISTANCE then
                    play_random_sound()
                end
            end
        end
    end
end)