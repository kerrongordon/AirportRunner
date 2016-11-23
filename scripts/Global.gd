extends Node

var currentScene = null

var PlayerName = 'Kerron Gordon'
export var playerSpeed = 500

var btn_right = Input.is_action_pressed("ui_right")
var btn_left = Input.is_action_pressed("ui_left")

onready var levels = get_node("/root/").get_groups().has("levels")
onready var level_one = get_node("/root/level_one/player")
onready var cloud1 = get_node("/root/level_one/cloud1")
onready var camera2d = get_node("/root/level_one/player/Camera2D")

var clould_speed_min = 10
var clould_speed_avg = 50
var clould_speed_max =100

func getPlayerName():
	return PlayerName

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	Global.set("Max_power_level", 2000)
	print('i am global', str(levels))


func setScene(scene):
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)

func _fixed_process(delta):
	moveLeftRight(level_one, playerSpeed)
	#move_clouds(cloud1, clould_speed_avg, delta)

func moveLeftRight(level, speed):
	btn_right = Input.is_action_pressed("ui_right")
	btn_left = Input.is_action_pressed("ui_left")

	if btn_left:
		move_left(level, speed)
	elif btn_right:
		move_right(level, speed)

#move player up or jump
func move_Up(level):
	level.set_linear_velocity(Vector2(level.get_linear_velocity().x,-700))

func move_down(level):
	level.set_linear_velocity(Vector2(level.get_linear_velocity().x,700))

#move player left on sreen
func move_left(level, speed):
	level.set_linear_velocity(Vector2(-speed,level.get_linear_velocity().y))

#move player right on sreen
func move_right(level, speed):
	level.set_linear_velocity(Vector2(speed,level.get_linear_velocity().y))

func _input(event):
	if event.type == 2: return

	if ( event.is_action_pressed("ui_up") ):
		move_Up(level_one)
		print("up")

	if ( event.is_action_pressed("ui_down") ):
		move_down(level_one)
		print("down")
		

#function to loop the cloud on the background of the level screen
func move_clouds(cloud, speed, delta):
	var cur_pos = cloud.get_pos()
	cur_pos.x -= speed * delta
	
	if ( cur_pos.x > camera2d.get_viewport_rect().size.width + cloud.get_item_rect().size.width/2 ):
		cur_pos.x = cloud.get_item_rect().size.width/2
	cloud.set_pos(cur_pos)
	if (cur_pos.x < 0):
		print('ok')
	
