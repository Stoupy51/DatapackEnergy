
scoreboard players add #global.incr_id energy.network_id 1
scoreboard players operation #machine.out energy.data = #global.incr_id energy.network_id

execute if score #machine.direction energy.data matches 0 run scoreboard players operation @s energy.network_id_down = #global.incr_id energy.network_id
execute if score #machine.direction energy.data matches 1 run scoreboard players operation @s energy.network_id_up = #global.incr_id energy.network_id
execute if score #machine.direction energy.data matches 2 run scoreboard players operation @s energy.network_id_north = #global.incr_id energy.network_id
execute if score #machine.direction energy.data matches 3 run scoreboard players operation @s energy.network_id_south = #global.incr_id energy.network_id
execute if score #machine.direction energy.data matches 4 run scoreboard players operation @s energy.network_id_east = #global.incr_id energy.network_id
execute if score #machine.direction energy.data matches 5 run scoreboard players operation @s energy.network_id_west = #global.incr_id energy.network_id

#define connected tags
tag @s remove energy.consumer_connected
execute if entity @s[tag=energy.send,tag=energy.receive] align xyz run function energy:v1.0/machine/update_adjacent_machine_2
execute if entity @s[tag=energy.send,tag=!energy.receive] align xyz run function energy:v1.0/machine/update_adjacent_machine_3
