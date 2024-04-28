extends Node3D

#UPGRADES
var tails_value : int = 1
var heads_value : int = 0
var rare_value : int = 1000
var multiplier : int = 1
var anim_speed : int = 1
var rare_chance : int = 1000
var flip_chance : int = 2
var autoflip : bool = false
var autoflip_speed : int = 4

var flip_outcome
var rare_flip

@onready var animation_player = $AnimationPlayer

func _ready():
	globalVars.coins.append(self)
	if globalVars.coins.size() > 1:
		self.position.x = globalVars.coins[globalVars.coins.size() - 2].position.x - 1.5

func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			coin_l_clicked()
		if event.button_index == MOUSE_BUTTON_RIGHT:
			coin_r_clicked()

func coin_l_clicked():
	# Play sfx
	rare_flip = randi_range(1, rare_chance)
	flip_outcome = randi_range(1, flip_chance)
	
	if rare_flip == 1:
		# Trigger rare flip
		animation_player.play("Flip Rare")
	else:
		if flip_outcome == 1:
			# Trigger heads
			animation_player.play("Flip Heads")
		else:
			# Trigger tails
			animation_player.play("Flip Tails")

func coin_r_clicked():
	pass

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Flip Rare":
			globalVars.money += rare_value * multiplier
		"Flip Heads":
			globalVars.money += heads_value * multiplier
		"Flip Tails":
			globalVars.money += tails_value * multiplier
