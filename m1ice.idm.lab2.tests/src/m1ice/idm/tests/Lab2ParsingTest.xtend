/*
 * generated by Xtext 2.12.0
 */
package m1ice.idm.tests

import com.google.inject.Inject
import m1ice.idm.lab1.StateMachine
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(Lab2InjectorProvider)
class Lab2ParsingTest {
	@Inject
	ParseHelper<StateMachine> parseHelper
	
	@Test
	def void loadModel() {
		val result = parseHelper.parse('''
			Hello Xtext!
		''')
		Assert.assertNotNull(result)
		Assert.assertTrue(result.eResource.errors.isEmpty)
	}
}
