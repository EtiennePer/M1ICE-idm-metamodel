package m1ice.idm.generator;

import fr.inria.diverse.k3.al.annotationprocessor.Main;
import m1ice.idm.generator.StateMachineAspect;
import m1ice.idm.lab1.Lab1Package;
import m1ice.idm.lab1.StateMachine;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Demo {
  public void run() {
    XMIResourceFactoryImpl fact = new XMIResourceFactoryImpl();
    boolean _containsKey = EPackage.Registry.INSTANCE.containsKey(Lab1Package.eNS_URI);
    boolean _not = (!_containsKey);
    if (_not) {
      EPackage.Registry.INSTANCE.put(Lab1Package.eNS_URI, Lab1Package.eINSTANCE);
    }
    Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("*", fact);
    ResourceSetImpl rs = new ResourceSetImpl();
    URI uri = URI.createURI("TrafficLights.fsm");
    Resource res = rs.getResource(uri, true);
    EObject _get = res.getContents().get(0);
    StateMachine fsm = ((StateMachine) _get);
    StateMachineAspect.run(fsm);
  }
  
  @Main
  public static void main(final String[] args) {
    InputOutput.<String>println("Run demo from Demo.xtend");
    new Demo().run();
  }
}
