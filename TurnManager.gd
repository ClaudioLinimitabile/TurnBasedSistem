extends Node

var ENTITY = {}
var index: int = 0
var TopEntity

#create a new entity to the manager
func NewEntity(Name: String, StarterFlag: bool = false) ->void:
	if StarterFlag:
		assert(TopEntity == null, "Error: more than 1 entity assigned as a start entity")
		TopEntity = index
	ENTITY[index]=[Name,StarterFlag]
	print("🔄 [TurnManager]: added entity: "+Name+" whit Flag: "+str(StarterFlag))
	index += 1

#reverse the turn of the selected name and also reverse the turn of the next entity(that can be the first if the list is finished)
func ChangeTurn(Name: String):
	for x in ENTITY:
		if ENTITY[x][0]==Name:
			ENTITY[x][1] = !ENTITY[x][1]
			if x+1<ENTITY.size():
				ENTITY[x+1][1]= true
			else:
				ENTITY[0][1]= true

#return true if the entity that is requesting have turn true
func RequestTurn(Name: String) -> bool:
	assert(TopEntity != null, "Error: no starter entity assigned")
	for x in ENTITY:
		if ENTITY[x][0]==Name:
			if ENTITY[x][1]:
				return true
	return false
