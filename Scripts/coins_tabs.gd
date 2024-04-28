extends TabContainer

@onready var tabTemplate = preload("res://Scenes/tab_template.tscn")

var currNumCoins = 0
var currTab = 0

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
	
	if self.visible:
		self.get_child(currTab).outline_visible = true
	else:
		self.get_child(currTab).outline_visible = false


func _on_tab_changed(tab):
	self.get_child(currTab).outline_visible = false
	currTab = self.current_tab
