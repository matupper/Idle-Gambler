extends Node3D

@onready var player = $"../../Player"
@onready var coinTemplate = preload("res://Scenes/coin.tscn")
@onready var cost_text = $Price
@onready var buy_text = $Buy
@onready var cam = $"../../Camera3D/AnimationPlayer"

var cost = 25

var numCoins = 1

var table_upgrade : bool = false
var sold_out : bool = false
var table_cost = 250

func _process(_delta):
	cost_text.mesh.text = str(cost)
	if globalVars.coins.size() >= globalVars.table_positions[globalVars.currTable].size() and globalVars.currTable < 2:
		table_upgrade = true
		cost_text.mesh.text = str(table_cost)
		buy_text.mesh.text = "Upgrade Table: $"
		buy_text.mesh.material.albedo_color = Color(2, 1, 1)
	elif globalVars.coins.size() >= globalVars.table_positions[globalVars.currTable].size():
		sold_out = true
		cost_text.visible = false
		buy_text.mesh.text = "SOLD OUT"
		buy_text.mesh.material.albedo_color = Color(2, 1, 1)
	else:
		buy_text.mesh.material.albedo_color = Color(1, 2, 1)
		table_upgrade = false
		buy_text.mesh.text = "Buy Coin: $"

func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$click.play()
		if not table_upgrade and not sold_out and globalVars.money >= cost:
			globalVars.money -= cost
			var newCoin = coinTemplate.instantiate()
			numCoins += 1
			newCoin.coinID = numCoins
			player.add_child(newCoin)
			cost *= 5
		elif table_upgrade:
			if globalVars.money >= table_cost:
				if globalVars.currTable == 0:
					cam.play("ToTable2")
				elif  globalVars.currTable == 1:
					cam.play("ToTable3")
				globalVars.currTable += 1
				table_cost *= 10
		else:
			pass
