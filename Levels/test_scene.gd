extends Node3D

@export var player_packed: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.is_server:
		print("is_server")
		
		multiplayer.peer_connected.connect(spawn_player)
		multiplayer.peer_disconnected.connect(remove_player)
		
		for id in Global.players:
			initialize_player(id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func initialize_player(id: int):
	print("Spawning: ", id)
	var player_scene = player_packed.instantiate()
	player_scene.id = id
	player_scene.name = str(id)
	player_scene.show()
	add_child(player_scene, true)
	player_scene.global_position = $PlayerSpawn.global_position

func spawn_player(id: int):
	initialize_player(id)
	Global.players.append(id)

func remove_player(id: int):
	print("Removing: ", id)
	get_node(str(id)).queue_free()
	Global.players.erase(id)
