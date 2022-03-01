extends Button

enum OPENMODE {
	
}

export var hide_again := true
export(NodePath) var popup_path : NodePath

var popup : WindowDialog

func _ready():
	popup = get_node(popup_path)


func _on_popupOpener_pressed():
	if !popup is WindowDialog:
		push_error(str(popup, " is not a WindowDialog"))
		return
	
	if !popup.visible:
		
		popup.popup()
		popup.connect("popup_hide", popup, "show")
		return
	
	
	if hide_again:
		popup.disconnect("popup_hide", popup, "show")
		popup.hide()
