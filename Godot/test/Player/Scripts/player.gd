class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	pass
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
func SetDirection() -> bool: 
		var new_dir : Vector2 = cardinal_direction
		if direction == Vector2.ZERO:
			return false
		#need 8 direction animation for 8 direction movement 
		#there probably should be a parent conditional regarding combat state
		if direction.y == 0:
			new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
		elif direction.x == 0:
			new_dir = Vector2.UP if direction.y <0 else Vector2.DOWN
	
		if new_dir == cardinal_direction:
			return false
		cardinal_direction = new_dir
		sprite.scale.x = - 1 if cardinal_direction == Vector2.LEFT else 1
		return true

	
	

func UpdateAnimation(state : String) -> void:
	if Global.iswalking == true:
		animation_player.play(state + "_" + AnimDirection())
	else:
		animation_player.play("idle" + "_" + AnimDirection())
		

func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:#&&LEFT return downleft?
		return "down"
	elif  cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
	
