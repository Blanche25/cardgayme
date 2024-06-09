extends MarginContainer


@onready var cardDatabase = preload("res://assets/cards/CardDatabase.gd")
var cardName = 'placeholder'
@onready var cardIndex = cardDatabase[cardName]
#non so perche senza questo index non funzia
@onready var cardInfo = cardDatabase.DATA[cardIndex]
#texture della carta
@onready var cardImg = str("res://assets/cards/",cardInfo[0],"/",cardName,".png")
# Called when the node enters the scene tree for the first time.
func _ready():
	#0 cr,sp,bu 
	#1 costo 
	#2 nome
	#3 tipo
	#4 att
	#5 hp
	#6 special
	print(cardImg)
	var cardSize = size
	$Card.texture = load(cardImg)
	#scala l art della carta
	$Card.scale *= cardSize/$Card.texture.get_size()
	
	$VBoxContainer/TopBar/Name/CenterContainer/Name.text = cardName
	$VBoxContainer/TopBar/Cost/CenterContainer/Cost.text = str(cardInfo[1])
	$VBoxContainer/stats/Stats/CenterContainer/Stats.text = str(cardInfo[4],"/",cardInfo[5])
	$VBoxContainer/Infobox/Info/CenterContainer/Info.text = cardInfo[6]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
