extends Control

signal join(ip: String, port: int)
signal host(port: int, max_clients: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_main_menu_join(ip, port):
	join.emit(ip, port)

func _on_main_menu_host(port, max_clients):
	host.emit(port, max_clients)
