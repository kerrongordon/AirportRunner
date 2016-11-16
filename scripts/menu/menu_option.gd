
extends Node

#get the back button 
onready var goBackToMenu = get_node("option_menu_btn_back")

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.type == 2: return
	
	#button to take me back to the main menu
	if ( goBackToMenu.is_pressed() and !event.is_echo() ):
		get_parent().get_node("view/menu_anim").play("option-to-menu")



