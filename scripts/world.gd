
extends Node2D

var currentScene = null
var PlayerName = "Mike"
var musicAudio = 1

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)

func setScene(scene):
   #clean up the current scene
   currentScene.queue_free()
   #load the file passed in as the param "scene"
   var s = ResourceLoader.load(scene)
   #create an instance of our scene
   currentScene = s.instance()
   # add scene to root
   get_tree().get_root().add_child(currentScene)
   

func getPlayerName():
	return PlayerName
	
func music_on_off(node, id):
	if musicAudio == 0: 
		node.set_volume(id,1)
	#if musicAudio == 1:
		#node.set_volume(id,0) 
