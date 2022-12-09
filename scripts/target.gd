extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	get_parent().get_node("Sprite").set_modulate(Color(1,1,1,1))
	$CollisionShape2D.set_deferred("disabled", true)
	#$CollisionShape2D.set_disabled(true)
	#print("d")
	body._target_reached()

func _enable():
	get_parent().get_node("Sprite").set_modulate(Color(0,1,0,1))
	$CollisionShape2D.set_deferred("disabled", false)

