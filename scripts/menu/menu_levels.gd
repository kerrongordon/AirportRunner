
extends Node

#get the back button 
onready var goBackToMenu = get_node("levels_menu_btn_back")

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.type == 2: return
	
	#button to take me back to the main menu
	if ( goBackToMenu.is_pressed() and not event.is_echo() ):
		get_parent().get_node("view/menu_anim").play("levels-to-menu")


