class_name State_Combat extends State

@export var move_speed : float = 00.0

@onready var idle : State_Idle = $"../Idle"
@onready var walk: State_Walk = $"../Walk"

#what happens when player enters state, can add combat state too
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

#what happens when player exits state
func Exit() -> void:
	pass

#physics process
func Process(_delta : float) -> State:
	if player.SetDirection(): #needs to be if player != attack swing, maybe use physics and 
		player.UpdateAnimation("idle")#walk anim back to pos
	return null
	
func Physics(_delta : float) -> State:
	return null

#handles input
func HandleInput(_event : InputEvent) -> State:
	return null

	
