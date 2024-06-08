extends VBoxContainer

@export var value: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Values/HSlider.value = value
	$Values/Label.text = str(value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_label_text_submitted(new_text):
	if new_text.is_valid_int():
		value = int(new_text)
		
		if value > 32:
			value = 32
		elif value < 1:
			value = 1
		
		$Values/HSlider.value = value
	else:
		$Values/Label.text = str(value)

func _on_h_slider_value_changed(new_value):
	value = new_value
	$Values/Label.text = str(value)
