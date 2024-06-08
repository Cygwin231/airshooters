extends VBoxContainer

@export var ip: String = "127.0.0.1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func new_ip(new_text = $IP.text):
	ip = new_text
