package m1ice.idm.generator

import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import m1ice.idm.lab1.StateMachine
import static extension m1ice.idm.generator.StateMachineAspect.*;
import m1ice.idm.lab1.Lab1Package
import fr.inria.diverse.k3.al.annotationprocessor.Main

class Demo {

	public def run() {
		var fact = new XMIResourceFactoryImpl
		if (!EPackage.Registry.INSTANCE.containsKey(Lab1Package.eNS_URI)) {
			EPackage.Registry.INSTANCE.put(Lab1Package.eNS_URI, Lab1Package.eINSTANCE);
		}
		// FsmPackage.eINSTANCE;
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("*", fact);

		var rs = new ResourceSetImpl()

		// var uri = URI.createURI(args.get(0));
		var uri = URI.createURI("TrafficLights.fsm");
		var res = rs.getResource(uri, true);
		var StateMachine fsm = res.contents.get(0) as StateMachine
		fsm.run
	}

	@Main
	def static void main(String[] args) {
		println('Run demo from Demo.xtend')
		new Demo().run()
	}
}
