stateMachine MetaModeledStateMachine
	state opened
	state closed init
	
	transition OFF opened -> closed
	transition ON closed -> opened