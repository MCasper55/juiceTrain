extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.name == "Player":
		reload.call_deferred()
		
		#note: i may want to make it so some objects like the ball despawn upon touching this but im leaving that up to you for when it becomes a problem :) i am thinking you should use tags that specify which items should despawn when entering the area. have fun!
func reload():
	get_tree().reload_current_scene()
