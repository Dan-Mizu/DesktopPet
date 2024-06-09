extends VBoxContainer

@onready var _line_edit := $LineEdit


func _ready():
	
	for btn in $Grid.get_children():
		btn.focus_mode = FOCUS_NONE
		if btn.get_signal_connection_list("pressed").size() > 0:
			continue
		btn.connect("pressed", _eval_btn.bind(btn.text))
	_line_edit.grab_focus()

func _eval_btn(text:String):
	_line_edit.grab_focus()
	var car_pos = _line_edit.caret_column
	_line_edit.insert_text_at_caret(text)
	if text.ends_with("("):
		_line_edit.insert_text_at_caret(")")
	_line_edit.caret_column = car_pos + 1


func _on_Equals_pressed():
	var ex := Expression.new()
# warning-ignore:return_value_discarded
	ex.parse(_line_edit.text)
	_line_edit.text = str(ex.execute([], null, false))
	if ex.has_execute_failed():
		_line_edit.text = ex.get_error_text()
	_line_edit.caret_column = _line_edit.text.length()





func _on_clearbtn_pressed():
	_line_edit.text = ""

func _on_backbtn_pressed():
	var text : String = _line_edit.text
	text.erase(_line_edit.caret_column-1, 1)
	var car_pos = _line_edit.caret_column
	_line_edit.text = text
	_line_edit.caret_column = car_pos-1




func _on_Calculator_about_to_show():
	_line_edit.call_deferred("grab_focus")
