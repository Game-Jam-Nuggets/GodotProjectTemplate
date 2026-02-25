extends Node

## --- public vars ---
var current_scene: Node = null

## --- export vars ---
@export var scenes: Dictionary[String, PackedScene]

## --- default methods ---

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_room("main_menu")
	
## --- public methods ---

## Changes the room
func change_room(scene_name: String) -> void:
	if !scenes.has(scene_name):
		return
		
	var scene = scenes[scene_name]
	
	# Remove current room
	if current_scene and is_instance_valid(current_scene):
		current_scene.queue_free()
		
	# Load new room
	current_scene = scene.instantiate()
	add_child(current_scene)
