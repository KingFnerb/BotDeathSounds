local sounds = {
    "bot_death_sound_1.ogg",
    "bot_death_sound_2.ogg",
    -- Add more sounds as needed
}
-- Pick Random Sound
local function play_random_sound()
    local index = math.random(#sounds)
    local sound_name = sounds[index]
    game.play_sound{path = sound_name, volume_modifier=1.0}
end

--Bot Death
script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity
    if entity and (entity.name == "construction-robot" or "logistic-robot") then play_random_sound()
    end
end)

