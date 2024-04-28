extends Node

var coins = []

var money = 0

var total_flips = 0

var upgradeUI : bool = false

var currTable : int = 0

#disgusting coin grid creation
const table1_positions = [Vector3(0, 0, 0), Vector3(-1.5, 0, 0), Vector3(1.5, 0, 0)]

const table2_positions = [Vector3(0, 0, 0), Vector3(-1.5, 0, 0), Vector3(1.5, 0, 0),
	Vector3(-3, 0, 0), Vector3(3, 0, 0), Vector3(0, 0, 1.5), Vector3(0, 0, -1.5), 
	Vector3(0, 0, 3), Vector3(0, 0, -3), Vector3(-1.5, 0, 1.5), Vector3(1.5, 0, 1.5),
	Vector3(-1.5, 0, -1.5), Vector3(1.5, 0, -1.5)]
	
const table3_positions = [Vector3(0, 0, 0), Vector3(-1.5, 0, 0), Vector3(1.5, 0, 0),
	Vector3(-3, 0, 0), Vector3(3, 0, 0), Vector3(0, 0, 1.5), Vector3(0, 0, -1.5), 
	Vector3(0, 0, 3), Vector3(0, 0, -3), Vector3(-1.5, 0, 1.5), Vector3(1.5, 0, 1.5),
	Vector3(-1.5, 0, -1.5), Vector3(1.5, 0, -1.5)]
	
const table_positions = [table1_positions, table2_positions, table3_positions]
