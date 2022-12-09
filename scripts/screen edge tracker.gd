extends Node2D


export var spin: bool = true

var NextTargetList: Array = ["donuts","pizza","donuts","fish"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if spin == true:
		$simple.rotate(.1)
		print($simple/target.get_global_position())
	else:
		pass
