extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.connected_to_server.connect(on_connect)
	multiplayer.connection_failed.connect(leave)
	multiplayer.server_disconnected.connect(leave)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass # Replace with function body.

func host(port, max_clients):
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, max_clients)
	if error:
		return error
	
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.multiplayer_peer = peer
	
	on_connect()

func join(ip, port):
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(ip, port)
	if error:
		return error
	
	peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	multiplayer.multiplayer_peer = peer

func leave():
	multiplayer.multiplayer_peer = null
	$Chat.hide()

func on_connect():
	$Chat.show()
