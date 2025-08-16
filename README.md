# TurnBasedSistem
A very simple turn based sistem to implement in godot 4 project 

HOW TO USE:
-for every node that need to be managed by turn use NewEntity(name,flag) by default the flag is false you have to define an entity that is true to put it as a starter entity (the first to move) be ware that only one entity can be a starter entity
    EXAMPLE: NewEntity(self.name,true) 
-you can shift the turn in the entity list by using ChangeTurn(Name) it is going to revers the turn of the entity selected and making true the next entity on the list
-you can listen in a _process() for the turn for a particular entity to become true whit RequestTurn(Name) it is going to return true if the entity selected has turn true
    EXAMPLE: if RequestTurn(self.name):
                #your logic here
