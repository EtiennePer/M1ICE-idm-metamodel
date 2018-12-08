package m1ice.Xtend.lab;
	
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;

public class MetaModeledStateMachine {

	private State current;
	
	private List<State> states = new ArrayList();
	
	public MetaModeledStateMachine() {
		this.current = new Closed();
		
		// Adding every states
		this.states.add(new Opened());
		this.states.add(new Closed());
	}
	
	/**
	 * Hande the state change.
	 * @param transition, the transition name wanted by the user.
	 */
	 public String next(String transition){
		// OFF transition from opened to closed
		if(transition.toLowerCase().equals("OFF".toLowerCase())) {
			this.current = states.stream().filter(state -> state.getName().equals("closed")).findFirst().get();
			return "Transition : OFF from opened to closed";
		}
	
		// ON transition from closed to opened
		if(transition.toLowerCase().equals("ON".toLowerCase())) {
			this.current = states.stream().filter(state -> state.getName().equals("opened")).findFirst().get();
			return "Transition : ON from closed to opened";
		}
	
		else
		{
			return "transition " + transition + " does not exists.";
		}
	}
	
	public static void main(String[] args) {
		
		// Create a new StateMachine
		MetaModeledStateMachine metaModeledStateMachine = new MetaModeledStateMachine();
		
		// First print the init state
		System.out.println("Starting the StateMachine ... press 'exit' to stop.");
		System.out.println("## The init state is : " + metaModeledStateMachine.current.getName());

		Scanner scanner = new Scanner(System.in);
		String entry = "";
		// Main loop
		while (!entry.equals("exit")) {
			System.out.println("## Choose a transition/exit :");
			entry = scanner.nextLine();
			
			// Change the desired state
			String result = metaModeledStateMachine.next(entry);
			
			if (result != null){
				System.out.println(result);
			}
			
			System.out.println("## The current state is : " + metaModeledStateMachine.current.getName());
			
		}
		
		System.out.println("MetaModeledStateMachine has been stopped.");
		
	}
	
	/**
	 * Getter of current.
	 */
	public State getCurrent(){
		return this.current;
	}
	
	/**
	 * Setter of current.
	 */
	public void setCurrent(State current){
		this.current = current;
	}
}
