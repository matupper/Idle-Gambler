extends Node3D

var amount = 0
var currCoin

func _process(_delta):
	amount = globalVars.coins[currCoin].gain
	$amount.mesh.text = str(amount)
