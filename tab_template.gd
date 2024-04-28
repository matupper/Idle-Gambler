extends TabBar

var coin = 0

@onready var auto_flip_text = $"Auto-Flip/Text"
@onready var auto_flip_cost = $"Auto-Flip/CostLabel/Auto-Flip Cost"
@onready var multiplier_text = $Multiplier/Text
@onready var multiplier_cost = $"Multiplier/CostLabel/Multiplier Cost"
@onready var tails_val_text = $"Tails-Val/Text"
@onready var tails_val_cost = $"Tails-Val/CostLabel/Tails-Val Cost"
@onready var heads_val_text = $"Heads-Val/Text"
@onready var heads_val_cost = $"Heads-Val/CostLabel/Heads-Val Cost"
@onready var flip_speed_text = $"Flip-Speed/Text"
@onready var flip_speed_cost = $"Flip-Speed/CostLabel/Flip-Speed Cost"
@onready var flip_chance_text = $"Flip-Chance/Text"
@onready var flip_chance_cost = $"Flip-Chance/CostLabel/Flip-Chance Cost"
@onready var rare_chance_text = $"Rare-Chance/Text"
@onready var rare_chance_cost = $"Rare-Chance/CostLabel/Rare-Chance Cost"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().set_editable_instance(self, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_multiplier_button_pressed():
	globalVars.money -= 1
	globalVars.coins[coin].multiplier += 1


func _on_close_tabs_pressed():
	globalVars.upgradeUI = false
