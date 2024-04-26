extends Node3D

var rare_chance = 1000
var flip_chance = randi_range(1, 2)
var rare_flip

@onready var animation_player = $AnimationPlayer
@onready var upgrade_menu = $Control

signal flipped_heads()
signal flipped_tails()
signal flipped_rare()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		coin_l_clicked()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		coin_r_clicked()
	pass # Replace with function body.

func coin_l_clicked():
	# Play sfx
	rare_flip = randi_range(1, rare_chance)
	flip_chance = randi_range(1, 2)
	
	if rare_flip == 1:
		# Trigger rare flip
		animation_player.play("Flip Rare")
	else:
		if flip_chance == 1:
			# Trigger heads
			animation_player.play("Flip Heads")
		else:
			# Trigger tails
			animation_player.play("Flip Tails")
			

func coin_r_clicked():
	upgrade_menu.visible = not upgrade_menu.visible
	

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Flip Rare":
		emit_signal("flipped_rare")
	if anim_name == "Flip Heads":
		emit_signal("flipped_heads")
	if anim_name == "Flip Tails":
		emit_signal("flipped_tails")
	pass # Replace with function body.
