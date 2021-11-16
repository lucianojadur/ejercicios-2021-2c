!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:54'!
test01CoordenadasPorDefaultEsElOrigen
	| marsRover coords|
	marsRover := MarsRover new.
	coords := marsRover coordenadas.
	self assert: 0 equals: coords x.
	self assert: 0 equals: coords y.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:54'!
test02IniciarMarsRoverConCoordenadasIniciales
	|marsRover coords|
	coords := 1@2.
	marsRover := MarsRover enCoordenadas: coords.
	self assert: coords x equals: marsRover coordenadas x.
	self assert: coords y equals: marsRover coordenadas y.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:10:18'!
test03DireccionPorDefaultEsNorte
	| marsRover |
	marsRover := MarsRover new.
	self assert: 'N' equals: marsRover direccionCardinal.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:10:18'!
test04IniciarMarsRoverConDireccionInicial
	| marsRover direccionInicial |
	direccionInicial := 'S'.
	marsRover := MarsRover conDireccion: direccionInicial.
	self assert: direccionInicial equals: marsRover direccionCardinal.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coords direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:54'!
coordenadas
	^ coords.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:13:43'!
direccionCardinal
	" la direccion seguramente sea algo mas complejo que un string pero por ahora va bien asi "
	^ direccion.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:11:24'!
initialize
	coords := 0@0.
	direccion := 'N'.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:11:06'!
initializeConDireccion: aDirection
	direccion := aDirection.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:05'!
initializeEnCoordenadas: aPoint
	coords := aPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:12:00'!
conDireccion: aDirection
	| newMarsRover |
	newMarsRover := MarsRover new.
	newMarsRover initializeConDireccion: aDirection.
	^ newMarsRover.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:31'!
enCoordenadas: aPoint
	| newMarsRover |
	newMarsRover := MarsRover new.
	newMarsRover initializeEnCoordenadas: aPoint.
	^ newMarsRover.! !
