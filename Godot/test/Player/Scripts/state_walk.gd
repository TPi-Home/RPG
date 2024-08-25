class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State_Idle = $"../Idle"
#what happens when player enters state, can add combat state too
func Enter() -> void:
	player.UpdateAnimation("walk")


#what happens when player exits state
func Exit() -> void:
	pass

#physics process
func Process(_delta : float) -> State:
	if Global.iswalking == true:
		if player.direction == Vector2.ZERO:
			return idle
		player.velocity = player.direction * move_speed
	
		if player.SetDirection() && Global.iswalking == true:
			player.UpdateAnimation("walk")
		return null
	else:
		player.UpdateAnimation("idle")
		player.velocity = Vector2.ZERO
		return null
	
func Physics(_delta : float) -> State:
	return null

#handles input
func HandleInput(_event : InputEvent) -> State:
	return null

	
