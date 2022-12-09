extends KinematicBody2D


onready var target= null
var speed = 100
var Ctarget = 0


func _ready():
	_set_target()

func _set_target():
	#target = get_parent().get_node("goals").get_child(Ctarget)
	#print(get_parent().NextTargetList.size())
	if Ctarget <= get_parent().NextTargetList.size()-1:
		var next = get_parent().NextTargetList[Ctarget]
		target = get_parent().get_node("goals").get_node(next)
		get_parent().get_node("goals").get_node(next).get_node("area")._enable()
		#print(get_parent().get_node("goals").get_child(Ctarget).get_name())
		Ctarget += 1
	else:
		pass#else: shouldve used one dictionary and this will be the victory message
	

func _physics_process(delta):
	if target != null:
		if get_global_position().distance_to(target.get_global_position()) >= $dir.get_offset().x*10:
			$dir.show()
			$dir.look_at(target.get_global_position())
		else:
			$dir.hide()
			
	var move_dir = Vector2(0,0)
	move_dir.x = int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left'))
	#move_local_x(x)
	move_dir.y = int(Input.is_action_pressed('ui_down')) - int(Input.is_action_pressed('ui_up'))
	#move_local_y(y)
	move_and_slide(move_dir*speed)
	
	#if Input.is_action_pressed("ui_accept"):
		#get_parent().spin = !get_parent().spin

func _target_reached():
	_set_target()
	$Camera2D/message/RichTextLabel.clear()
	$Camera2D/message.nxtMess()
