
extends Node

onready var goBackToMenu = get_node("option_menu_btn_back")

func _ready():
	set_process_input(true)
	
func _input(event):
	if ( goBackToMenu.is_pressed() and !event.is_echo() ):
		get_parent().get_node("view/menu_anim").play("option-to-menu")
		print("go back")


