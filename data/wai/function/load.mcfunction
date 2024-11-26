# Add scoreboard
scoreboard objectives add wai.warden_warning_level dummy
scoreboard objectives add wai.time_last_spawn dummy
scoreboard objectives add wai.before_warden_display dummy
scoreboard objectives add wai.last_spawn.player_data dummy

scoreboard objectives add wai.last_spawn.calcul_to_sec dummy
scoreboard objectives add wai.last_spawn.calcul_to_min dummy

scoreboard objectives add wai.last_spawn.stock_sec dummy
scoreboard objectives add wai.last_spawn.stock_min dummy

scoreboard objectives add wai.last_spawn.next_chance dummy

scoreboard objectives add wai.toggle.display trigger

# Set scoreboard
scoreboard players set wai.player_name wai.last_spawn.calcul_to_sec 20
scoreboard players set wai.player_name wai.last_spawn.calcul_to_min 60

scoreboard players set @s wai.last_spawn.next_chance 10

scoreboard players set @a wai.toggle.display 0


# Run the tick function
schedule function wai:tick 1t