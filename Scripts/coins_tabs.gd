extends TabContainer

@onready var tabTemplate = preload("res://Scenes/tab_template.tscn")

var currNumCoins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.visible = globalVars.upgradeUI
	
	if currNumCoins < globalVars.coins.size(): 
		currNumCoins += 1
		var newTab = tabTemplate.instantiate()
		add_child(newTab)
		newTab.coinNum = globalVars.coins.size() - 1
		newTab.name = "Coin "+ str(currNumCoins)
