# Allow all players to enable or disable the display system.
scoreboard players enable @a wai.toggle.display


# If a player's wai.toggle.display score is 1, enable the system, display a confirmation message and add 1 to scoreboard to move to 2.
execute as @p if score @s wai.toggle.display matches 1 run tellraw @s [{"text":"Warden Warning Alert has been toggled on"}]
execute as @p if score @s wai.toggle.display matches 1 run scoreboard players add @s wai.toggle.display 1

# If a player's wai.toggle.display score is 3, disable the system, display a confirmation message and remove 3 to scoreboard to move to 0.
execute as @p if score @s wai.toggle.display matches 3 run tellraw @s [{"text":"Warden Warning Alert has been toggled off"}]
execute as @p if score @s wai.toggle.display matches 3 run scoreboard players remove @s wai.toggle.display 3


# Retrieve the time elapsed since the last Warden spawn and store it in the scoreboard 'wai.last_spawn.player_data'.
execute as @p store result score @s wai.last_spawn.player_data run data get entity @s warden_spawn_tracker.ticks_since_last_warning

# Store score of player data in 'wai.last_spawn.stock_sec' scoreboard
execute as @p store result score @s wai.last_spawn.stock_sec run scoreboard players get @s wai.last_spawn.player_data

# Divided in sec 
execute as @p run scoreboard players operation @s wai.last_spawn.stock_sec /= wai.player_name wai.last_spawn.calcul_to_sec

# Store the score once divided in the scoreboard 'wai.last_spawn.stock_min'
execute as @p store result score @s wai.last_spawn.stock_min run scoreboard players get @s wai.last_spawn.stock_sec

# Divided in min
execute as @p run scoreboard players operation @s wai.last_spawn.stock_min /= wai.player_name wai.last_spawn.calcul_to_min



# If score wai.last_spawn.stock_min match with 0, 1, 2... set the wai.last_spawn.next_chance to 10, 9, 8...
execute as @p if score @s wai.last_spawn.stock_min matches 0 run scoreboard players set @s wai.last_spawn.next_chance 10
execute as @p if score @s wai.last_spawn.stock_min matches 1 run scoreboard players set @s wai.last_spawn.next_chance 9
execute as @p if score @s wai.last_spawn.stock_min matches 2 run scoreboard players set @s wai.last_spawn.next_chance 8
execute as @p if score @s wai.last_spawn.stock_min matches 3 run scoreboard players set @s wai.last_spawn.next_chance 7
execute as @p if score @s wai.last_spawn.stock_min matches 4 run scoreboard players set @s wai.last_spawn.next_chance 6
execute as @p if score @s wai.last_spawn.stock_min matches 5 run scoreboard players set @s wai.last_spawn.next_chance 5
execute as @p if score @s wai.last_spawn.stock_min matches 6 run scoreboard players set @s wai.last_spawn.next_chance 4
execute as @p if score @s wai.last_spawn.stock_min matches 7 run scoreboard players set @s wai.last_spawn.next_chance 3
execute as @p if score @s wai.last_spawn.stock_min matches 8 run scoreboard players set @s wai.last_spawn.next_chance 2
execute as @p if score @s wai.last_spawn.stock_min matches 9 run scoreboard players set @s wai.last_spawn.next_chance 1
execute as @p if score @s wai.last_spawn.stock_min matches 10 run scoreboard players set @s wai.last_spawn.next_chance 0



# Retrieve the warning level of player and store it in the scoreboard 'wai.warden_warning_level'.
execute as @p store result score @s wai.warden_warning_level run data get entity @s warden_spawn_tracker.warning_level


# If score wai.toggle.display matche 2 display the text with the appropriate information
execute as @p if score @s wai.toggle.display matches 2 if score @s wai.warden_warning_level matches 0 run title @s actionbar [{"text":"Warning level: ","color":"white"},{"text":"0","color":"green"}]
execute as @p if score @s wai.toggle.display matches 2 if score @s wai.warden_warning_level matches 1 run title @s actionbar [{"text":"Warning level: ","color":"white"},{"text":"1","color":"yellow"},{"text":" | "},{"text":"Next Chance: "},{"score":{"objective":"wai.last_spawn.next_chance","name":"*"},"color":"light_purple"},{"text":"min","color":"light_purple"}]
execute as @p if score @s wai.toggle.display matches 2 if score @s wai.warden_warning_level matches 2 run title @s actionbar [{"text":"Warning level: ","color":"white"},{"text":"2","color":"gold"},{"text":" | "},{"text":"Next Chance: "},{"score":{"objective":"wai.last_spawn.next_chance","name":"*"},"color":"light_purple"},{"text":"min","color":"light_purple"}]
execute as @p if score @s wai.toggle.display matches 2 if score @s wai.warden_warning_level matches 3 run title @s actionbar [{"text":"Warning level: ","color":"white"},{"text":"3","color":"red"},{"text":" | "},{"text":"Next Chance: "},{"score":{"objective":"wai.last_spawn.next_chance","name":"*"},"color":"light_purple"},{"text":"min","color":"light_purple"}]
execute as @p if score @s wai.toggle.display matches 2 if score @s wai.warden_warning_level matches 4 run title @s actionbar [{"text":"Warning level: ","color":"white"},{"text":"4","color":"blue"},{"text":" | "},{"text":"Next Chance: "},{"score":{"objective":"wai.last_spawn.next_chance","name":"*"},"color":"light_purple"},{"text":"min","color":"light_purple"}]



# Repeat the function every ticks
schedule function wai:tick 1t