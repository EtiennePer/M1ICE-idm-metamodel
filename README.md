# TP IDM Metamodel - M1 ICE
### Pericat Etienne et Kaïs Ben-Youssef

## Usage
#### Retrieving working project
1) Clone the repo in your/a new workspace.

2) Run gemoc and go to **File &rarr; Open projects from file system &rarr; Directory &rarr; choose the cloned directory** .

3) **m1ice.idm.lab1** and open **model/lab1.genmodel** &rarr; right click on Lab1 &rarr; **Generate All**.

4) Go to **m1ice.idm.lab2/src/m1ice.idm/** and right click on **GenerateLab2.mwe2** &rarr; Run as &rarr; Mwe2 Workflow.

5) **Important : **When importing project from a git repository there is some build path issues: If it is missing, right click on m1ice.idm.lab1 and add a new folder &rarr; src (the build path should update automatically). Also add **src** and **xtend-gen** folder in m1ice.idm.lab2.ui.tests **or every folder that appear missing in the "problems" section.**. **Rerun step4 after that**.

6) Go tu **Run** &rarr; **Run Configuration** &rarr; Right click on **Eclipse application**. Make sure Gemoc is selected in Main &rarr; Run a product. And that "all workspace ..." is selected in **Plugins section**.

#### Run a test
Here you are with your new instance of Gemoc that is running the generated plugin.

To test the plugin :
- **Create** a new Java project.
- Add a file with **.q** extension.
- You can use the stateMachine language in this file.

An example of file would be :
~~~~
stateMachine MetaModeledStateMachine
	state closed init
	state opened

	transition OFF opened -> down
	transition ON closed -> opened

	state down
	transition stop closed -> down
	transition stop opened -> down
~~~~
You can add transition or states, or rename every components.

- When saving '.q' file generated classes are placed into **src-gen** folder.
- Put them into **src/..** (m1ice.Xtend.lab package or edit file to new package).

You can now run the main in "MetaModeledStateMachine.java (or the file corresponding to what you wrote)" and write your transition into the console and see that the stateMachine is acting as you defined it into the .q file.

## Sample files
Sample files (model and generated) can be found in **sample** folder.
