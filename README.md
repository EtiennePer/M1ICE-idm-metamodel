# TP IDM Metamodel - M1 ICE
### Pericat Etienne et Kaïs Ben-Youssef

## Installation
- Clone the repo
-  
## Example of file that represents a state machine
After launching eclipse with "lab2" plugin. Create a .q file with the content below.
~~~~
stateMachine MetaModeledStateMachine
	state opened
	state closed init

	transition OFF opened -> closed
	transition ON closed -> opened
  ~~~~

After saving, classes are generated in src-gen folder. You can copy these files (in src/m1ice.Xtend.lab package for example) and run "MetaModeledStateMachine.java".

## Sample files
Sample files (model and generated) can be found in **sample** folder.
