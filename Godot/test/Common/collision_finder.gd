class_name CollisionFinder extends Area2D
#will be better to use a vector for this, just doing this temporarily.
#as mentioned below, this will end up being a seperate system for more than just combat.
var player : Player
# Called when the node enters the scene tree for the first time.
## Emitted when the battler finished their action and arrived back at their rest position.
signal action_finished
## Forwarded from the receiving of [signal BettlerStats.health_depleted].
signal health_depleted
## Emitted when taking damage or being healed from a [BattlerHit].
## [br][br]Note the difference between this and [signal BattlerStats.health_changed]:
## 'hit_received' is always the direct result of an action, requiring graphical feedback.
signal hit_received(value: int)
## Emitted whenever a hit targeting this battler misses.
signal hit_missed
## Emitted when the battler's `_readiness` changes.
signal readiness_changed(new_value)
## Emitted when the battler is ready to take a turn.
signal ready_to_act
## Emitted when modifying `is_selected`. The user interface will react to this for
## player-controlled battlers.
signal selection_toggled(value: bool)

@export var stats: BattlerStats = null
# Each action's data stored in this array represents an action the battler can perform.
# These can be anything: attacks, healing spells, etc.
#@export var actions: Array[BattlerAction]
# If the battler has an `ai_scene`, we will instantiate it and let the AI make decisions.
# If not, the player controls this battler. The system should allow for ally AIs.
@export var ai_scene: PackedScene
@export var is_player: = false
@export var pause_controls = false


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func _on_body_entered(body: Node2D) -> void:
	#this should probably be attached to battlers, just using a placeholder enemy while building combat
	Global.iswalking = false
	pass # Replace with function body.
