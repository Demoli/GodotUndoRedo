extends Node2D

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Undoer.save_state({"counter":counter})
	$Label.text = str(counter)

func _on_undo_button_pressed():
	$Undoer.undo()
	update_label()

func _on_redo_button_pressed():
	$Undoer.redo()
	update_label()

func _on_increment_button_pressed():
	$Undoer.save_state({"counter":counter})
	counter += 1
	update_label()

func _on_decrement_button_pressed():
	counter -= 1
	$Undoer.save_state({"counter":counter})
	update_label()

func update_label():
	$Label.text = str(counter)
