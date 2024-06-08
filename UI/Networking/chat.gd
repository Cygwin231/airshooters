extends Control

var chat_message_packed: PackedScene = preload("res://UI/Networking/chat_message.tscn")

var focus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	leave_focus()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("enter"):
		leave_focus() if focus else enter_focus()
		focus = !focus

func _on_line_edit_text_submitted(new_text):
	if new_text != "":
		update_chat.rpc("%d: %s\n" % [multiplayer.get_unique_id(), new_text])
		$LineEdit.text = ""

@rpc("any_peer", "call_local", "reliable", 0)
func update_chat(new_message):
	var chat_message_scene = chat_message_packed.instantiate()
	chat_message_scene.set_message(new_message)
	var index = $Messages.get_child_count()
	$Messages.add_child(chat_message_scene)
	$Messages.move_child(chat_message_scene, index)

func enter_focus():
	$LineEdit.show()
	$LineEdit.grab_focus()
	for N in $Messages.get_children():
		N.focus = true

func leave_focus():
	$LineEdit.hide()
	for N in $Messages.get_children():
		N.focus = false
