extends Node3D

@onready var moneyText = $Money
@onready var monPerSecText = $Money2

var startMoney

var currMoney = globalVars.money - 1
var monString : String

func _ready():
	_moneyPerSec()

func _process(_delta):
	_checkMoney()

func _checkMoney():
	if not currMoney == globalVars.money:
		monString = " " + str(globalVars.money)
		currMoney = globalVars.money
		moneyText.mesh.text = monString
		$AnimationPlayer.play("add_money")

func _moneyPerSec():
	while true:
		startMoney = globalVars.money
		await get_tree().create_timer(1).timeout
		monPerSecText.mesh.text = " " + str(globalVars.money - startMoney)
