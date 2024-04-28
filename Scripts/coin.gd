extends Node3D

#UPGRADES
var tails_value : int = 1
var heads_value : int = 0
var rare_value : int = 1000
var multiplier : int = 1
var anim_speed : float = 1
var rare_chance : int = 1000
var flip_chance : int = 2
var autoflip : bool = false
var autoflip_speed : float = 4
var autoflip_on : bool = false

var flip_outcome
var rare_flip

var gain = 0

@onready var outline = $Outline

@onready var animation_player = $AnimationPlayer
@onready var audio_stream = $SFX/AudioStreamPlayer
@onready var gainLabel = $gain


func _ready():
	globalVars.coins.append(self)
	if globalVars.coins.size() > 1:
		self.position = globalVars.table_positions[globalVars.currTable][globalVars.coins.size() - 1]
	gainLabel.currCoin = globalVars.coins.size() - 1

func _process(_delta):
	if autoflip and not autoflip_on:
		_autoflip_run()
	
	animation_player.speed_scale = anim_speed
	audio_stream.pitch_scale = anim_speed

func _autoflip_run():
	autoflip_on = true
	
	while autoflip:
		await get_tree().create_timer(autoflip_speed).timeout
		coin_l_clicked()

func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			coin_l_clicked()
		if event.button_index == MOUSE_BUTTON_RIGHT:
			coin_r_clicked()

func coin_l_clicked():
	if not animation_player.is_playing():
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
			gain = rare_value * multiplier
			globalVars.money += gain
		"Flip Heads":
			gain = heads_value * multiplier
			globalVars.money += gain
		"Flip Tails":
			gain = tails_value * multiplier
			globalVars.money += gain
