extends Node2D

var foo = 0
var bar = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_undo_button_pressed():
	$Undoer.undo()

func _on_redo_button_pressed():
	$Undoer.redo()

func _on_rand_button_pressed():
	foo = randi()
	bar = randi()
	$Undoer.save_state({"foo":foo,"bar":bar})
	print(foo,bar)



