extends Node2D

const cardSize = Vector2(100, 150)
const CardBase = preload("res://cards/CardBase.tscn")
const playerHand = preload("res://cards/PlayerHand.gd")
var cardSelected = []
@onready var deckSize = playerHand.cardList.size()

@onready var centreOval = Vector2(get_viewport().size.x, get_viewport().size.y) * Vector2(0.5, 1.3)
@onready var horRad = get_viewport().size.x*0.45
@onready var verRad = get_viewport().size.y*0.4
var angle = deg_to_rad(90)
var ovalAngle = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


func drawCard():
	var newCard = CardBase.instantiate()
	cardSelected = randi() % deckSize
	newCard.cardName = playerHand.cardList[cardSelected]
	#newCard.position = get_global_mouse_position()
	ovalAngle = Vector2(horRad * cos(angle), - verRad * sin(angle))
	newCard.position = centreOval + ovalAngle - newCard.size/2
	newCard.scale *= cardSize / newCard.size
	$Cards.add_child(newCard)
	playerHand.cardList.erase(playerHand.cardList[cardSelected])
	deckSize -=1
	angle += 0.2
	return deckSize
