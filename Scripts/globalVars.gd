extends Node

var coins = []

var money : int = 0

var total_flips = 0

var upgradeUI : bool = false

var currTable : int = 0

#disgusting coin grid creation
const table1_positions = [Vector3(0, 0, 0), Vector3(-1.5, 0, 0), Vector3(1.5, 0, 0)]

const table2_positions = [Vector3(0, 0, 0), Vector3(-3, 0, 0), Vector3(3, 0, 0),
	Vector3(-1.5, 0, 2.6), Vector3(1.5, 0, 2.6), Vector3(-1.5, 0, -2.6), Vector3(1.5, 0, -2.6)]
	
const table3_positions = [Vector3(-3, 0, -3), Vector3(-1, 0, -3), Vector3(1, 0, -3), Vector3(3, 0, -3), 
						  Vector3(-3, 0, -1), Vector3(-1, 0, -1), Vector3(1, 0, -1), Vector3(3, 0, -1), 
						  Vector3(-3, 0,  1), Vector3(-1, 0,  1), Vector3(1, 0,  1), Vector3(3, 0,  1), 
						  Vector3(-3, 0,  3), Vector3(-1, 0,  3), Vector3(1, 0,  3), Vector3(3, 0,  3),]
	
const table_positions = [table1_positions, table2_positions, table3_positions]

#func _process(_delta):
	#if money == 1002:
		#money += 2
