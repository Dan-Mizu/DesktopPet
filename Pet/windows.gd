extends Control


func _ready():
	
	for popup in get_children():
		# Don't do this if it is not a popup
		if !popup is Popup: continue
		
		#popup.connect("gui_input", _on_input(popup))


func _on_input(event:InputEvent, window:Popup):
	if event is InputEventMouseButton:
		move_child(window, get_child_count()-1)

