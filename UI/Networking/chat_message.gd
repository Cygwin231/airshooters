extends MarginContainer

var alpha = 1.0
var dead = false
@export var focus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(10).timeout
	dead = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if focus:
		$Text.modulate.a = 1.0
		alpha = 1.0
	else:
		$Text.modulate.a = alpha
	if dead:
		alpha -= 2.5 * delta

# Delete when not visible
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func set_message(message: String):
	$Text.text = message
