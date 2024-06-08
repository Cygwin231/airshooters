extends CharacterBody3D

@export var id = 0

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var camera = $Camera3D

func _enter_tree():
	id = name.to_int()
	set_multiplayer_authority(id)

func _process(_delta):
	print(get_multiplayer_authority(), id)

func _physics_process(delta):
	if multiplayer.get_unique_id() == id:
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta
		if Input.is_action_just_pressed("ui_cancel"):
				get_tree().quit()
	

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			
			camera.rotate_z(direction.x * delta)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
		move_and_slide()
