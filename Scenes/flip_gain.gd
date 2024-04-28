extends Node3D

var gain = 0

func _process(_delta):
	$Label.mesh.text = str(gain)
