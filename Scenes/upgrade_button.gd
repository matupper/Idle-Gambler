extends Node3D

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$AnimationPlayer.play("move_away")
		await $AnimationPlayer.animation_finished
		self.visible = false
		globalVars.upgradeUI = not globalVars.upgradeUI

func _process(_delta):
	if not self.visible and not globalVars.upgradeUI:
		self.visible = true
		$AnimationPlayer.play("move_back") 
