extends TextEdit

@onready var save_timer = $saveTimer

const NOTES_PATH := "user://notes.txt"


func _ready():
	#load
	var f = FileAccess.open(NOTES_PATH, FileAccess.READ)
	if f == null:
		prints(FileAccess.get_open_error())
		return
	text = f.get_as_text()
	f.close()

func _on_Notes_text_changed():
	save_timer.start()

func _on_saveTimer_timeout():
	# save
	var f = FileAccess.open(NOTES_PATH, FileAccess.WRITE)
	if f == null:
		prints(FileAccess.get_open_error())
		return
	f.store_string(text)
	f.close()
	print("Notes saved")
