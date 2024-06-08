extends Control

signal join(ip: String, port: int)
signal host(port: int, max_clients: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_join_button_up():
	var ip = $MarginContainer/VBoxContainer/HBoxContainer/IPBox.ip
	var port = $MarginContainer/VBoxContainer/HBoxContainer/PortBox.port
	
	join.emit(ip, port)

func _on_host_button_up():
	var port = $MarginContainer/VBoxContainer/HBoxContainer/PortBox.port
	var max_clients = $MarginContainer/VBoxContainer/MaxPlayers.value
	
	host.emit(port, max_clients)
