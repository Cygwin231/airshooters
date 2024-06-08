extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.connection_failed.connect(on_connection_failed)
	multiplayer.server_disconnected.connect(on_server_disconnected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_menu_controller_join(ip, port):
	var error = $Networker.join(ip, port)
	if error:
		print_error(str(error))
		return
	
	# Switch to loading screen
	leave_menu()

func _on_menu_controller_host(port, max_clients):
	var error = $Networker.host(port, max_clients)
	if error:
		print_error(str(error))
		return
	
	# Switch to loading screen
	leave_menu()

func on_connection_failed():
	print_error("Connection failed")
	return_menu()

func on_server_disconnected():
	print_error("Server disconnected")
	return_menu()

func leave_menu():
	$MenuController.hide()

func return_menu():
	$MenuController.show()

func print_error(error: String):
	print(error)
