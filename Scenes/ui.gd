extends Control


@onready var label = $VBoxContainer/HBoxContainer2/CenterContainer2/Container/Label
@onready var label_2 = $VBoxContainer/HBoxContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Label2


func v(x:float) -> float:
	return x *(10-(2*x))**2


func _on_h_slider_value_changed(value):
	label.text = str(value)
	label_2.text = str(v(value))

