// AspectJ classes that have been aspectized and name
package m1ice.idm.lab1;
public aspect AspectJStateMachine{
void around (m1ice.idm.lab1.StateMachine self)  :target (self) && (call ( void m1ice.idm.lab1.StateMachine.run(  ) ) ) { m1ice.idm.generator.StateMachineAspect.run(self );}

}
