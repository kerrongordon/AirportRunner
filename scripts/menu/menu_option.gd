
extends Node

#get the back button 
onready var goBackToMenu = get_node("option_menu_btn_back")

func _ready():
	set_process_input(true)
	var name = get_node("/root/Global").getPlayerName()
	get_node("userName").set_text(str("Player Name: ", name))
	
func _input(event):
	if event.type == 2: return
	
	#button to take me back to the main menu
	if ( goBackToMenu.is_pressed() and not event.is_echo() ):
		get_node("/root/Global").setScene("res://scenes/menu_scenes/main_menu.tscn")
		print("go back to main menu")




