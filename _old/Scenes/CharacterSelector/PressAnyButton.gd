extends RichTextLabel

var CharacterSelectorModule
var MainModule
# Called when the node enters the scene tree for the first time.
func _ready():
	CharacterSelectorModule = get_parent()
	MainModule = CharacterSelectorModule.get_parent().get_parent().get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var joined = CharacterSelectorModule.joined
	joined = Input.is_joy_button_pressed(CharacterSelectorModule.deviceId, JOY_BUTTON_A)
	if joined:
		MainModule.player_added.emit(CharacterSelectorModule.deviceId)
		queue_free()
