class_name Enemy extends Area2D

var player : Player

@onready var state_machine: PlayerStateMachine = $StateMachine

var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	body.game_over()
	pass # Replace with function body.
