extends Node2D

var message_storage: Array =[
	"Hi. Im here to tell you where to go to next follow the red arrow.      %",
	"now we are going to the next place to get food!      %",
	"Shouldve used a dictionary here.       %",
	"Cause this is weird.      %",
	"and we're done     %"
]

var current_message: int =0

var message: String = ''
var C_message: String = ""
var index: int = 0

func _ready():
	nxtMess()

func _on_Timer_timeout():
	var next_letter = message.substr(index,1)
	C_message = C_message + next_letter#message.substr(index,1)
	$RichTextLabel.set_text(C_message)
	index+=1
	if next_letter != " " and next_letter != ".":
		if $Sprite.frame == 0:
			$Sprite.frame = 1
		else:
			$Sprite.frame = 0
	if next_letter == "%":
		$RichTextLabel.clear()
		$RichTextLabel.set_text(" ")
		$Timer.stop()
	
#	else:
#		print('space')

func nxtMess():
	if current_message <= message_storage.size()-1:
		C_message = ""
		index = 0
		message = message_storage[current_message]
		current_message += 1
		$Timer.start()
	#else: shouldve used one dictionary and this will be the victory message

