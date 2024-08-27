class_name State_Battle extends State



@onready var idle : State_Idle = $"../Idle"
@onready var walk: State_Walk = $"../Walk"
#what happens when player enters state, can add combat state too

func Enter() -> void:
	player.UpdateAnimation("idle")

#what happens when player exits state
func Exit() -> void:
	pass

#physics process
func Process(_delta : float) -> State:
	player.velocity = Vector2.ZERO
	return null
	
func Physics(_delta : float) -> State:
	return null

#handles input
func HandleInput(_event : InputEvent) -> State:
	return null

	
