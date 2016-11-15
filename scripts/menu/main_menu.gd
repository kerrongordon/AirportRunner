
extends Node

var index = 0

onready var startGame = get_node("main_menu_btn_start")
onready var gameOption = get_node("main_menu_btn_option")
onready var quitGame = get_node("main_menu_btn_quit")

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	#Set window title
	OS.set_window_title("Just A Game Menu")

func _input(event):
	if ( startGame.is_pressed() and !event.is_echo() ):
		print('start gamae')

	if ( gameOption.is_pressed() and !event.is_echo() ):
		get_parent().get_node("view").get_node("menu_anim").play("menu-to-option")
		print('option')
	
	if ( quitGame.is_pressed() and !event.is_echo() ):
		OS.get_main_loop().quit()
	