extends TextureButton

var deckSize = INF
# Called when the node enters the scene tree for the first time.
func _ready():
	scale *= $'../../'.cardSize / size

func _gui_input(event):
	if Input.is_action_just_released("leftclick"):
		if deckSize > 0:
			deckSize = $'../../'.drawCard()
			if deckSize == 0:
				disabled = true
