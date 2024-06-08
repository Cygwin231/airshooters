extends VBoxContainer

@export var port: int = 32214

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func new_port(new_text = $Port.text):
	if new_text.is_valid_int():
		port = int(new_text)
	else:
		$Port.text = str(port)
