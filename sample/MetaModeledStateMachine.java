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
		this.states.add(new Closed());
		this.states.add(new Opened());
		this.states.add(new Down());
	}
	
	/**
	 * Hande the state change.
	 * @param transition, the transition name wanted by the user.
	 */
	 public String next(String transition){
		// OFF transition from opened to down
		if(transition.toLowerCase().equals("OFF".toLowerCase())) {
			
			// If the current state is opened
			if("opened".equals(this.current.getName())) {
			
				this.current = states.stream().filter(state -> state.getName().equals("down")).findFirst().get();
				return "Transition : OFF from opened to down";
			} else {
				return "## Can't run transition OFF because the current state is "+this.current.getName()+" and should be opened";
			}
		}
	
		// ON transition from closed to opened
		if(transition.toLowerCase().equals("ON".toLowerCase())) {
			
			// If the current state is closed
			if("closed".equals(this.current.getName())) {
			
				this.current = states.stream().filter(state -> state.getName().equals("opened")).findFirst().get();
				return "Transition : ON from closed to opened";
			} else {
				return "## Can't run transition ON because the current state is "+this.current.getName()+" and should be closed";
			}
		}
	
		// stop transition from closed to down
		if(transition.toLowerCase().equals("stop".toLowerCase())) {
			
			// If the current state is closed
			if("closed".equals(this.current.getName())) {
			
				this.current = states.stream().filter(state -> state.getName().equals("down")).findFirst().get();
				return "Transition : stop from closed to down";
			} else {
				return "## Can't run transition stop because the current state is "+this.current.getName()+" and should be closed";
			}
		}
	
		// stop transition from opened to down
		if(transition.toLowerCase().equals("stop".toLowerCase())) {
			
			// If the current state is opened
			if("opened".equals(this.current.getName())) {
			
				this.current = states.stream().filter(state -> state.getName().equals("down")).findFirst().get();
				return "Transition : stop from opened to down";
			} else {
				return "## Can't run transition stop because the current state is "+this.current.getName()+" and should be opened";
			}
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
		System.out.println("Starting the MetaModeledStateMachine ... press 'exit' to stop.");
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
