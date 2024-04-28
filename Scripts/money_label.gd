extends Node3D

@onready var moneyText = $Money

var currMoney = globalVars.money

func _process(_delta):
	_checkMoney()

func _checkMoney():
	if not currMoney == globalVars.money:
		currMoney = globalVars.money
		moneyText.mesh.text = str(currMoney)
		$AnimationPlayer.play("add_money")
