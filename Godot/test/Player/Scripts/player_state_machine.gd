class_name PlayerStateMachine extends Node

var states : Array [State]
var prev_state : State
var current_state : State

#this is to keep player in State_Battle until enemy or player dies
var state_locked = false

#var exit_combat : State # or current state == combat && enemyhp == 0
@onready var battle : State_Battle = get_node("Battle")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ChangeState(current_state.Process(delta))
	pass

func physics_process(delta: float) -> void:
	ChangeState(current_state.Physics(delta))
	pass

func _unhandled_input(event) -> void:
	ChangeState(current_state.HandleInput(event))
	pass
	
func Initialize( _player : Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states.size() > 0:
		states[0].player = _player
	ChangeState(states[0])
	process_mode = Node.PROCESS_MODE_INHERIT #determines whether to use process or process physics

func ChangeState(new_state : State) -> void:
	#checks if state_locked has been unlocked by completing a battle in battle state
	if state_locked == true:
		return
	if new_state == null or new_state == current_state: #&& current_state != in_combat?
		return
	
	if current_state:
		current_state.Exit()
	
	prev_state = current_state
	current_state = new_state
	current_state.Enter()
