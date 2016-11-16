
extends Node

# get all buttons on the main menu screen
onready var startGame     = get_node("main_menu_btn_start")
onready var gameOption    = get_node("main_menu_btn_option")
onready var quitGame      = get_node("main_menu_btn_quit")

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	#Set window title
	OS.set_window_title("Menu Menu")
	
func _fixed_process(delta):
	pass



func _input(event):
	if event.type == 2: return
	#button to start the game	
	if ( startGame.is_pressed() and not event.is_echo() ):
		get_parent().get_node("view").get_node("menu_anim").play("menu-to-levels")
		print('start gamae')
		
	#buton to go to the option menu
	if ( gameOption.is_pressed() and not event.is_echo() ):
		get_parent().get_node("view").get_node("menu_anim").play("menu-to-option")
		print('option')
		
	#button to quit the game
	if ( quitGame.is_pressed() and not event.is_echo() ):
		OS.get_main_loop().quit()
	