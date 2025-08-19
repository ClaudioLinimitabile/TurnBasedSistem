@icon("TMicon.svg")
@tool
extends Node
class_name TurnLoader

@export var debug_mode : bool = true

func _ready() -> void:
	if not Engine.is_editor_hint():
		TurnManager.DEBUG_MODE = debug_mode
		TurnManager.Reset()

func _enter_tree():
	if Engine.is_editor_hint():
		update_configuration_warnings()

func _notification(what):
	if what == NOTIFICATION_PARENTED or what == NOTIFICATION_UNPARENTED:
		update_configuration_warnings()

func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	# Controllo posizione tra i fratelli
	var parent = get_parent()
	if parent:
		if parent.get_child(0) != self:
			warnings.append("TurnLoader should be put as a first node in the parent tree to make sure it loads first")
	else:
		warnings.append("TurnLoader should be put under a parent node like for example (Main node)")
	
	return warnings
