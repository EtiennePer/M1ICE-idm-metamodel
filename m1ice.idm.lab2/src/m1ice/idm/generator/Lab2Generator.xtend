/*
 * generated by Xtext 2.12.0
 */
package m1ice.idm.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import m1ice.idm.lab1.StateMachine
import m1ice.idm.lab1.State
import m1ice.idm.lab1.Transition
import fr.inria.diverse.k3.al.annotationprocessor.Aspect;
import static extension m1ice.idm.generator.StateMachineAspect.*;
import static extension m1ice.idm.generator.StateAspect.*;
import static extension m1ice.idm.generator.TransitionAspect.*;
import fr.inria.diverse.k3.al.annotationprocessor.Step
import fr.inria.diverse.k3.al.annotationprocessor.Singleton
import java.io.BufferedReader
import java.io.InputStreamReader
import fr.inria.diverse.k3.al.annotationprocessor.Main
import java.util.Scanner

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class Lab2Generator extends AbstractGenerator {

	val String DEFAULT_PACKAGE = "m1ice.Xtend.lab"
	val String DEFAULT_PATH = ""

	var StateMachine stateMachine;

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {

		// Get the desired StateMachine object
		this.stateMachine = resource.contents.get(0) as StateMachine

		// Generate State class of State Pattern
		fsa.generateFile(DEFAULT_PATH + '/State.java', printAbstractState())

		// Generate each State as a class
		stateMachine.states.forEach [ st |
			fsa.generateFile(DEFAULT_PATH + '/' + st.name.toFirstUpper() + '.java', st.print)
		]

		// Generate the StateMachine
		fsa.generateFile(stateMachine.name.toFirstUpper() + '.java', stateMachine.print)

	}

	// # ---------------------------- #
	// # - STATE MACHINE GENERATION - #
	// # ---------------------------- #
	/**
	 * Define the content of the StateMachine class. 
	 */
	def print(StateMachine machine) {
		var machineLower = machine.name.toFirstLower();
		var machineUpper = machine.name.toFirstUpper();

		'''
			package «DEFAULT_PACKAGE»;
				
			import java.util.Scanner;
			import java.util.ArrayList;
			import java.util.List;
			
			public class «machineUpper» {
			
				private State current;
				
				private List<State> states = new ArrayList();
				
				«machine.initializeFSM()»
				
				public «machineUpper»() {
					«FOR state : machine.states»
						«IF state.init»
							this.current = new «state.name.toFirstUpper»();
						«ENDIF»
					«ENDFOR»
					
					// Adding every states
					«FOR state : machine.states»
						this.states.add(new «state.name.toFirstUpper()»());
					«ENDFOR»
				}
				
				/**
				 * Hande the state change.
				 * @param transition, the transition name wanted by the user.
				 */
				 public String next(String transition){
				 «FOR transition : machine.transitions»
				 	// «transition.name» transition from «transition.from.name» to «transition.to.name»
				 	if(transition.toLowerCase().equals("«transition.name»".toLowerCase())) {
				 		
				 		// If the current state is «transition.from.name»
				 		if("«transition.from.name»".equals(this.current.getName())) {
				 		
				 			this.current = states.stream().filter(state -> state.getName().equals("«transition.to.name»")).findFirst().get();
				 			return "Transition : «transition.name» from «transition.from.name» to «transition.to.name»";
				 		} else {
				 			return "## Can't run transition «transition.name» because the current state is "+this.current.getName()+" and should be «transition.from.name»";
				 		}
				 	}
				 	
				«ENDFOR»
				else
				{
					return "transition " + transition + " does not exists.";
				}
				}
				
				public static void main(String[] args) {
					// Create a new StateMachine
					«machineUpper» «machineLower» = new «machineUpper»();
					
					// First print the init state
					System.out.println("Starting the «machineUpper» ... press 'exit' to stop.");
					System.out.println("## The init state is : " + «machineLower».current.getName());
				
						Scanner scanner = new Scanner(System.in);
						String entry = "";
						// Main loop
						while (!entry.equals("exit")) {
							System.out.println("## Choose a transition/exit :");
							entry = scanner.nextLine();
							
							// Change the desired state
							String result = «machineLower».next(entry);
							
							if (result != null){
								System.out.println(result);
							}
							
							System.out.println("## The current state is : " + «machineLower».current.getName());
							
						}
						
						System.out.println("«machineUpper» has been stopped.");
						
				}
				
				«printGetterAndSetter("State", "current")»
				}
		'''
	}

	// # --------------------- #
	// # - STATES GENERATION - #
	// # --------------------- #
	/*
	 * Print the State abstract class used to implement the State Pattern.
	 */
	def printAbstractState() '''
		package «DEFAULT_PACKAGE»;
		
		/**
		 * A State used by a {@Link «stateMachine.name.toFirstUpper()»}
		 * @author generated
		 */
		public abstract class State {
			
			private String name;
					
			«printGetterAndSetter(State.name.class.simpleName, 'name')»
		}
	'''

	/**
	 * Define every states sub-classes.
	 */
	def print(State s) {

		var paramType = this.stateMachine.name.toFirstUpper()
		var paramName = this.stateMachine.name.toFirstLower()
		var stateName = s.name.toFirstUpper()

		'''
			package «DEFAULT_PACKAGE»;
			
			/**
			 * Represent a specific {@link State}.
			 * @author generated
			 */
			public class «stateName» extends State {
				
				public «stateName»(){
					this.setName("«stateName.toFirstLower()»");
				}		
			}
		'''
	}

	// # ----------- #
	// # - HELPERS - #
	// # ----------- #
	/**
	 * Define a getter and a setter for the given attribute.
	 */
	def printGetterAndSetter(String type, String attributeName) {

		// Define the variables
		val attributeNameUpper = attributeName.toFirstUpper()
		val attributeNameLower = attributeName.toFirstLower()
		val typeUpper = type.toFirstUpper()

		// Print the getter and setter content
		'''
			/**
			 * Getter of «attributeNameLower».
			 */
			public «typeUpper» get«attributeNameUpper»(){
				return this.«attributeNameLower»;
			}
			
			/**
			 * Setter of «attributeNameLower».
			 */
			public void set«attributeNameUpper»(«typeUpper» «attributeNameLower»){
				this.«attributeNameLower» = «attributeNameLower»;
			}
		'''
	}
}

@Aspect(className=typeof(StateMachine))
class StateMachineAspect {

	public State currentState

	public String underProcessTrigger
	public String consummedString

	def public void initializeFSM() {
		println("init FSM")
		_self.currentState = _self.states.findFirst[st|st.init == true];
		_self.run()
	}

	// Operational semantic
	def void run() {

		// reset if there is no current state
		if (_self.currentState == null) {
			_self.currentState = _self.states.findFirst[st|st.init == true];
		}

		var str = "init"
		var scanner = new Scanner(System.in);
		while (str != "quit") {
			println("Current state : " + _self.currentState.name)
			println("next transition name (or quit) ? : ")
			str = scanner.nextLine();
			if (str == "quit") {
				println("")
				println("quitting ...")
			} else if (str == "no") {
				println("")

			} else
				println(str)
			println("stepping...")
			try {
				_self.currentState.step(str)
			} catch (Exception err) {
				println(err.toString)
				str = "quit"
			}
		}
	}
}

@Aspect(className=typeof(Transition))
class TransitionAspect {

	@Step
	def public String fire() {
		println("firing transition " + _self.name + " go to state " + _self.to.name)
		val fsm = _self.from.fsm
		fsm.currentState = _self.to
		return _self.name
	}
}

@Aspect(className=typeof(State))
class StateAspect {

	@Step
	def public String step(String inputString) {

		println("looking for transition : " + inputString)
		val validTransitions = _self.outgoing.filter[t|inputString.compareTo(t.name) == 0];

		if (validTransitions.size > 0) {
			return validTransitions.get(0).fire
		}
	}
}
