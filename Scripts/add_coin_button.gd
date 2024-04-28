extends Node3D

@onready var player = self.get_parent_node_3d()
@onready var coinTemplate = preload("res://Scenes/coin.tscn")
@onready var cost_text = $Price
@onready var buy_text = $Buy

var cost = 1

var sold_out : bool = false

func _process(_delta):
	cost_text.mesh.text = str(cost)
	if globalVars.coins.size() >= globalVars.table_positions[globalVars.currTable].size():
		sold_out = true
		cost_text.visible = false
		buy_text.mesh.text = "Sold Out"
		buy_text.mesh.material.albedo_color = Color(2, 1, 1)
	else:
		buy_text.mesh.material.albedo_color = Color(1, 2, 1)
		sold_out = false
		cost_text.visible = true
		buy_text.mesh.text = "Buy Coin: $"

func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not sold_out and globalVars.money >= cost:
			globalVars.money -= cost
			var newCoin = coinTemplate.instantiate()
			player.add_child(newCoin)
			cost *= 3
