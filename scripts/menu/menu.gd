
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

onready var camera = get_node("view").get_pos()

func _ready():
	var conPos = Vector2(get_parent().get_item_rect().size.width/2,get_parent().get_item_rect().size.height/2)
	#set_fixed_process(true)


func _fixed_process(delta):
	
	camera.y = -600
	print(camera)