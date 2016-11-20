extends Node

var currentScene = null

var PlayerName = 'Kerron Gordon'
export var playerSpeed = 500

var btn_right = Input.is_action_pressed("ui_right")
var btn_left = Input.is_action_pressed("ui_left")

onready var levels = get_node("/root/").get_groups().has("levels")
onready var level_one = get_node("/root/level_one/player")

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

func moveLeftRight(level, speed):
	btn_right = Input.is_action_pressed("ui_right")
	btn_left = Input.is_action_pressed("ui_left")
	
	if btn_left: 
		level.set_linear_velocity(Vector2(-speed,level.get_linear_velocity().y))
	elif btn_right:
		level.set_linear_velocity(Vector2(speed,level.get_linear_velocity().y))
		
func moveUp(level):
	level.set_linear_velocity(Vector2(level.get_linear_velocity().x,-700))

func _input(event):
	if event.type == 2: return
	
	if ( event.is_action_pressed("ui_up") ):
		moveUp(level_one)
		print("up")
		
	if ( event.is_action_pressed("ui_down") ):
		print("down")
		
		