extends Node3D

# Table models
@onready var table1 = $Table1
@onready var table2 = $Table2
@onready var table3 = $Table3

# Define states for table level
enum Level {
	ONE,
	TWO,
	THREE
}

var current_level = Level.THREE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update table model
	match current_level:
		Level.ONE:
			table1.visible = true
			table2.visible = false
			table3.visible = false
		Level.TWO:
			table1.visible = false
			table2.visible = true
			table3.visible = false
		Level.THREE:
			table1.visible = false
			table2.visible = false
			table3.visible = true
			
	pass
