
extends Node

onready var backgroundMenuMusic = get_node("SamplePlayer")

onready var cloud1        = get_node("cloud1")
onready var cloud2        = get_node("cloud2")
onready var cloud3        = get_node("cloud3")
onready var cloud4        = get_node("cloud4")

var clould_speed_min = 10
var clould_speed_avg = 50
var clould_speed_max =100

onready var camera = get_node("view").get_pos()

func _ready():
	set_fixed_process(true)
	background_music()


func _fixed_process(delta):
	menu_clouds(cloud1, clould_speed_min, delta)
	menu_clouds(cloud2, (clould_speed_min * 2), delta)
	menu_clouds(cloud3, clould_speed_avg, delta)
	menu_clouds(cloud4, clould_speed_max, delta)

	
#function to loop the cloud on the background of the menu screen
func menu_clouds(cloud, speed, delta):
	var cur_pos = cloud.get_pos()
	cur_pos.x += speed * delta
	
	if ( cur_pos.x > cloud.get_viewport_rect().size.width + cloud.get_item_rect().size.width/2 ):
		cur_pos.x = -cloud.get_item_rect().size.width/2
	cloud.set_pos(cur_pos)
	
func background_music():
	var voiceID = backgroundMenuMusic.play("menu-music")
	world.music_on_off(backgroundMenuMusic, voiceID)
	
	