extends Node3D


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		globalVars.upgradeUI = not globalVars.upgradeUI
