extends Control

@onready var label_2 = $RightGraph/FunctionValues/CenterContainer2/HBoxContainer/Label2
@onready var label = $LeftSlider/Container/Label


func v(x:float) -> float:
	return x *(10-(2*x))**2


func _on_h_slider_value_changed(value):
	label_2.text = str(v(value))
	label.text = str(value)
