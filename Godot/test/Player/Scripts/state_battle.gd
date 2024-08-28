class_name State_Battle extends State

@onready var idle : State_Idle = $"../Idle"
@onready var walk: State_Walk = $"../Walk"

var player_state_machine: PlayerStateMachine
var incombat : bool = false

func _ready() -> void:
	pass
	#player = get_parent()

#what happens when player enters state, can add combat state too
func Enter() -> void:
	incombat = true
	player_state_machine = player.get_node("StateMachine") as PlayerStateMachine
	player.UpdateAnimation("idle")
	player_state_machine.state_locked = true
	await get_tree().create_timer(5).timeout 
	BattleOver()

#what happens when player exits state
func Exit() -> void:
	pass

func Process(_delta : float) -> State:
	player.velocity = Vector2.ZERO
	#need incombat bc process start immediately
	if player_state_machine.state_locked == false && incombat == false:
		Exit()
		return idle
	return null
	
func Physics(_delta : float) -> State:
	return null

func HandleInput(_event : InputEvent) -> State:
	return null
	
func BattleOver() -> bool:
	incombat = false
	player_state_machine.state_locked = false
	return true

	
