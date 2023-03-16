@tool
class_name MementoCaretaker
extends Node

var _originator
var _mementos

# Guardian. Provides a narrow interface to the mementos
func _init(originator):
	_originator = originator
	_mementos = []

func create():
	# "Store a new Memento of the Originators current state"
	var memento = _originator.get_memento()
	_mementos.append(memento)

func restore(index):
#	Replace the Originators current state with the state
#	stored in the saved Memento
	var memento = _mementos[index]
	_originator.set_memento(memento)

func size() -> int:
	return _mementos.size()

func clear():
	_mementos = []
