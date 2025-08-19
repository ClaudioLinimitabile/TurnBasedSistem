extends Node

var DEBUG_MODE = true

var ENTITY = {}
var index: int = 0
var TopEntity

#create a new entity to the manager
func NewEntity(Name: String, StarterFlag: bool = false) ->void:
	if StarterFlag:
		assert(TopEntity == null, "Error: more than 1 entity assigned as a start entity")
		TopEntity = index
	ENTITY[index]=[Name,StarterFlag]
	if DEBUG_MODE: print("🔄 [TurnManager]: added entity: "+Name+" whit Flag: "+str(StarterFlag)+" On Index: "+str(index))
	index += 1

#reverse the turn of the selected name and also reverse the turn of the next entity(that can be the first if the list is finished)
func ChangeTurn(Name: String) -> void:
	for x in ENTITY:
		ENTITY[x][1] = false
	
	for x in ENTITY:
		if ENTITY[x][0]==Name:
			if x+1<index:
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

#delete an entity and shift al the element position
func RemoveEntity(Name: String) -> void:
	var counter: int
	ENTITY.keys().sort()
	for x in ENTITY:
		if ENTITY[x][0]==Name:
			if ENTITY[x][1]:
				ChangeTurn(Name)
			if DEBUG_MODE: print("🔄 [TurnManager]: Entity Removed: "+ENTITY[x][0])
			ENTITY.erase(x)
			counter=x
	ENTITY.keys().sort()
	for x in ENTITY:
		if counter < x:
			ENTITY[x-1]=ENTITY[x]
	ENTITY.keys().sort()
	ENTITY.erase(index)
	index -= 1

#clear the entity for a reload or achange screen
func Reset() -> void:
	ENTITY.clear()
	TopEntity = null
	index = 0
	if DEBUG_MODE: print("🔄 [TurnManager]: Reset Eseguito")
