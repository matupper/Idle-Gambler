extends Node3D

var total_flips = 0

var money = 0
var h_val = 0
var h_mul = 1
var t_val = 1
var t_mul = 1
var r_val = 1000
var r_mul = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(total_flips)
	pass
	



func _on_coin_1_flipped_heads():
	var h_winnings = h_mul * h_val
	money += h_winnings
	total_flips += 1
	pass # Replace with function body.


func _on_coin_1_flipped_rare():
	var r_winnings = r_mul * r_val
	money += r_winnings
	total_flips += 1
	pass # Replace with function body.


func _on_coin_1_flipped_tails():
	var t_winnings = t_mul * t_val
	money += t_winnings
	total_flips += 1
	pass # Replace with function body.



func _on_button_pressed():
	t_val += 1
	pass # Replace with function body.
