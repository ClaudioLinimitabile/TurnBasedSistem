# TurnBasedSistem
# A very simple turn based sistem to implement in godot 4 project 

## HOW TO CONFIGURE:
### this script is ment to be used as a global script to configure a global script:
1. Go to **Project > Project Settings > Autoload**.
2. Search for `TurnManager.gd` and add it as an autoload.
3. press the ADD sign to add it at the auto load list make sure the check box is on.

## HOW TO USE:
1. for every node that need to be managed by turn use NewEntity(name,flag) by default the flag is false you have to define an entity that is true to put it as a starter entity (the first to move) be ware that only one entity can be a starter entity
    **EXAMPLE: NewEntity(self.name,true)** 
2. you can shift the turn in the entity list by using ChangeTurn(Name) it is going to revers the turn of the entity selected and making true the next entity on the list
3. you can listen in a _process() for the turn for a particular entity to become true whit RequestTurn(Name) it is going to return true if the entity selected has turn true
    **EXAMPLE: if RequestTurn(self.name):**
                **#your logic here**
4. use function reset() to reset the turn manager before changing or reloading a scene or it will keep the null information or use the TurnLoader tool search it on the node list (it has an icon of a clock) whit this tool u can also turn on debug mode whit the editor
5. you can use removeentity() to clear an entity and shift the position of all the entity