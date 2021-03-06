/*
 * generated by Xtext 2.12.0
 */
package m1ice.idm.formatting2

import com.google.inject.Inject
import m1ice.idm.lab1.State
import m1ice.idm.lab1.StateMachine
import m1ice.idm.lab1.Transition
import m1ice.idm.services.Lab2GrammarAccess
import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument

class Lab2Formatter extends AbstractFormatter2 {
	
	@Inject extension Lab2GrammarAccess

	def dispatch void format(StateMachine stateMachine, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		for (State state : stateMachine.states) {
			state.format;
		}
		for (Transition transition : stateMachine.transitions) {
			transition.format;
		}
	}
	
	// TODO: implement for 
}
