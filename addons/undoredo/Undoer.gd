@tool
class_name Undoer
extends Node

signal undone
signal redone

@export var target: Node = null
var originator
var caretaker
var memento_index = -1

func _enter_tree():
	originator = MementoOriginator.new()
	caretaker = MementoCaretaker.new(originator)
	if not target:
		target = get_parent()

func save_state(state: Dictionary):
	originator.set_state(state)
	caretaker.create()
	memento_index += 1

func undo():
	if memento_index <= caretaker.size():
		caretaker.restore(memento_index)
		memento_index -= 1
		var state = originator.get_memento().get_state()
		apply_to_parent(state)
		emit_signal("undone", state)
	
	return false
	
func redo():
	if memento_index <= caretaker.size():
		caretaker.restore(memento_index)
		memento_index += 1
		var state = originator.get_memento().get_state()
		apply_to_parent(state)
		emit_signal("redone", state)
	
	return false

func clear():
	caretaker.clear()

func apply_to_parent(state: Dictionary):
	for key in state:
		target[key] = state[key]
