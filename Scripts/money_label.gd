extends Node3D

@onready var moneyText = $Money

var currMoney = globalVars.money - 1
var monString : String

func _process(_delta):
	_checkMoney()

func _checkMoney():
	if not currMoney == globalVars.money:
		monString = " " + str(globalVars.money)
		currMoney = globalVars.money
		moneyText.mesh.text = monString
		$AnimationPlayer.play("add_money")
