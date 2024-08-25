class_name State extends Node

static var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#what happens when player enters state, can add combat state too
func Enter() -> void:
	pass

#what happens when player exits state
func Exit() -> void:
	pass

#process
func Process(_delta : float) -> State:
	return null

func Physics(_delta : float)-> State:
	return null
	
#handles input
func HandleInput(_event : InputEvent) -> State:
	return null
