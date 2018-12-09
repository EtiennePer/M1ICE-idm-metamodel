stateMachine MetaModeledStateMachine
	state closed init
	state opened
	
	transition OFF opened -> down
	transition ON closed -> opened
	
	state down
	transition stop closed -> down
	transition stop opened -> down