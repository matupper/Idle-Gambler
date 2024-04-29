extends TabBar

var coinNum = 0
var outline_visible = false

@onready var coin = globalVars.coins[coinNum]

@onready var auto_flip_text = $"Auto-Flip/Text"
@onready var auto_flip_cost_text = $"Auto-Flip/CostLabel/Auto-Flip Cost"
var auto_flip_cost = 5

@onready var multiplier_text = $Multiplier/Text
@onready var multiplier_cost_text = $"Multiplier/CostLabel/Multiplier Cost"
var multiplier_cost = 7

@onready var tails_val_text = $"Tails-Val/Text"
@onready var tails_val_cost_text = $"Tails-Val/CostLabel/Tails-Val Cost"
var tails_val_cost = 25

@onready var heads_val_text = $"Heads-Val/Text"
@onready var heads_val_cost_text = $"Heads-Val/CostLabel/Heads-Val Cost"
var heads_val_cost = 50

@onready var flip_speed_text = $"Flip-Speed/Text"
@onready var flip_speed_cost_text = $"Flip-Speed/CostLabel/Flip-Speed Cost"
var flip_speed_cost = 100

@onready var flip_chance_text = $"Flip-Chance/Text"
@onready var flip_chance_cost_text = $"Flip-Chance/CostLabel/Flip-Chance Cost"
var flip_chance_cost = 200

@onready var rare_chance_text = $"Rare-Chance/Text"
@onready var rare_chance_cost_text = $"Rare-Chance/CostLabel/Rare-Chance Cost"
var rare_chance_cost = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().set_editable_instance(self, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if coin != globalVars.coins[coinNum]:
		coin = globalVars.coins[coinNum]
	
	if outline_visible:
		coin.outline.visible = true
	else:
		coin.outline.visible = false
	
	$"Coin-Value/Value".text = "Dollars per flip ~ "\
		 + str(coin.multiplier * int(coin.tails_value + coin.heads_value / 2))
	_update_cost_texts()
	_update_texts()

func _update_cost_texts():
	auto_flip_cost_text.text = "$" + str(auto_flip_cost)
	multiplier_cost_text.text = "$" + str(multiplier_cost)
	tails_val_cost_text.text = "$" + str(tails_val_cost)
	heads_val_cost_text.text = "$" + str(heads_val_cost)
	flip_speed_cost_text.text = "$" + str(flip_speed_cost)
	flip_chance_cost_text.text = "$" + str(flip_chance_cost)
	rare_chance_cost_text.text = "$" + str(rare_chance_cost)

func _update_texts():
	if not coin.autoflip:
		auto_flip_text.text = " Automatically flips coin every " + str(coin.autoflip_speed) + " seconds"
	else:
		auto_flip_text.text = " Automatically flips coin every " \
			+ str(snapped(coin.autoflip_speed * 0.9, .01)) + " seconds"
	multiplier_text.text = " Multiply earnings to " \
		+ str(coin.multiplier + 1) + "x"
	tails_val_text.text = " Increase value of tails to $" \
		+ str(coin.tails_value + 1)
	heads_val_text.text = " Increase value of heads to $" \
		+ str(coin.heads_value + 1)
	flip_speed_text.text = " Speed up coin flip to " \
		+ str(coin.anim_speed + .1) + "x"
	flip_chance_text.text = " Increase chance to land on tails to " \
		+ str(coin.flip_chance / 2 + .5) + "x"
	rare_chance_text.text = " Increase chance of special flip to " \
		+ str(coin.rare_chance / 1000 + .02) + "x"

func _buy(cost):
	if globalVars.money >= cost:
		globalVars.money -= cost
		return true
	return false

func _on_multiplier_button_pressed():
	$click.play()
	if _buy(multiplier_cost):
		coin.multiplier += 1
		multiplier_cost *= 2

func _on_close_tabs_pressed():
	$click.play()
	globalVars.upgradeUI = false


func _on_auto_flip_button_pressed():
	$click.play()
	if _buy(auto_flip_cost):
		if coin.autoflip:
			coin.autoflip_speed *= .9
		else:
			coin.autoflip = true
		auto_flip_cost *= 1.5
		auto_flip_cost = int(auto_flip_cost)


func _on_tails_val_button_pressed():
	$click.play()
	if _buy(tails_val_cost):
		coin.tails_value += 1
		tails_val_cost *= 2


func _on_heads_val_button_pressed():
	$click.play()
	if _buy(heads_val_cost):
		coin.heads_value += 1
		heads_val_cost *= 2


func _on_flip_speed_button_pressed():
	$click.play()
	if _buy(flip_speed_cost):
		coin.anim_speed += .1
		flip_speed_cost *= 3


func _on_flip_chance_button_pressed():
	$click.play()
	if _buy(flip_chance_cost):
		coin.flip_chance += 1
		flip_chance_cost *= 2


func _on_rare_chance_button_pressed():
	$click.play()
	if _buy(rare_chance_cost):
		coin.rare_chance -= 20
		rare_chance_cost *= 2.5

