class_name State_Battle extends State

@onready var idle : State_Idle = $"../Idle"
@onready var walk: State_Walk = $"../Walk"

var player_state_machine: PlayerStateMachine

#what happens when player enters state, can add combat state too
func Enter() -> void:
	player_state_machine = player.get_node("StateMachine") as PlayerStateMachine
	player.UpdateAnimation("idle")
	player_state_machine.state_locked = true

#what happens when player exits state
func Exit() -> void:
	player_state_machine.state_locked = false
	pass

func Process(_delta : float) -> State:
	player.velocity = Vector2.ZERO
	return null
	
func Physics(_delta : float) -> State:
	return null

func HandleInput(_event : InputEvent) -> State:
	return null

	
