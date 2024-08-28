class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

var knockback_velocity: Vector2 = Vector2.ZERO
var knockback_duration: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	pass

func _physics_process(delta: float) -> void:
	if knockback_duration > 0:
		# Apply the knockback velocity
		knockback_duration -= delta
		velocity = knockback_velocity
	else:
		knockback_velocity = Vector2.ZERO  # Reset the velocity after knockback ends
	move_and_slide()
	if knockback_duration <= 0:
		knockback_velocity = Vector2.ZERO

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
	animation_player.play(state + "_" + AnimDirection())

func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:#&&LEFT return downleft?
		return "down"
	elif  cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

func ApplyKnockback(direction: Vector2, strength: float, duration: float) -> void:
	knockback_velocity = direction.normalized() * strength
	knockback_duration = duration

func OnCollide(enemy_position: Vector2) -> void:
	var knockback_strength = 500  # Adjust the strength of the knockback
	var knockback_duration = 0.3  # Duration of the knockback effect in seconds
	# Calculate the knockback direction (from enemy to player)
	var knockback_direction = global_position - enemy_position
	ApplyKnockback(knockback_direction, knockback_strength, knockback_duration)
