class_name CollisionFinder extends Area2D
#will be better to use a vector for this, just doing this temporarily.
#as mentioned below, this will end up being a seperate system for more than just combat.
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	#this should probably be attached to battlers, just using a placeholder enemy while building combat
	#also, should consider using incombat global here as a conditional check
	#state locking
	var player = body as Player
	var player_state_machine = player.get_node("StateMachine") as PlayerStateMachine
	var battle_state = player_state_machine.get_node("Battle") as State_Battle
	player_state_machine.ChangeState(battle_state)
	var knockback_direction = global_position - body.global_position
	#bypassing state machine to apply knockback, should create a knockback state so as to
	#allow users to 
	player.ApplyKnockback(knockback_direction, -500, 0.3)
	


	
	
