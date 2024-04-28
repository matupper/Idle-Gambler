extends Node3D

@onready var player = self.get_parent_node_3d()
@onready var coinTemplate = preload("res://Scenes/coin.tscn")

func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		globalVars.money -= 1
		var newCoin = coinTemplate.instantiate()
		player.add_child(newCoin)
