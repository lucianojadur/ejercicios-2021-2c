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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:10:18'!
test02DireccionPorDefaultEsNorte
	| marsRover |
	marsRover := MarsRover new.
	self assert: 'N' equals: marsRover direccionCardinal.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:10:25'!
test03IniciarMarsRoverConCoordenadasYDireccionInicial
	| marsRover coordsIniciales direccionInicial |
	coordsIniciales := 2@3.
	direccionInicial := 'W'.
	marsRover := MarsRover enCoordenadas: coordsIniciales conDireccion: direccionInicial.
	self assert: coordsIniciales equals: marsRover coordenadas.
	self assert: direccionInicial equals: marsRover direccionCardinal.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:47:39'!
test04NoSePuedeIniciarMarsRoverConDireccionInvalida
	| marsRover |
	self should: [marsRover := MarsRover enCoordenadas: 1@2 conDireccion: 'p'] raise: Error description: 'Direccion Invalida'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:42:54'!
test05MarsRoverRecibeComandoParaAvanzarDireccionNorteYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'N'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 2@5 equals: marsRover coordenadas.
	"En este modelo:
		N = +y
	W= -x        E= +x
		S = -y
	"! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:43:01'!
test06MarsRoverRecibeComandoParaAvanzarDireccionSurYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'S'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 2@3 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:43:11'!
test07MarsRoverRecibeComandoParaAvanzarDireccionOesteYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'W'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 1@4 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:43:19'!
test08MarsRoverRecibeComandoParaAvanzarDireccionEsteYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'E'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 3@4 equals: marsRover coordenadas.! !


!classDefinition: #Direccion category: 'MarsRover'!
Object subclass: #Direccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direccion methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:24:55'!
moveBackwards: aPoint
	self subclassResponsibility.! !

!Direccion methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:24:11'!
moveFoward: aPoint
	self subclassResponsibility.! !

!Direccion methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:31:04'!
nombre
	self subclassResponsibility.! !

!Direccion methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:25:31'!
rotateLeft
	self subclassResponsibility.! !

!Direccion methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:25:41'!
rotateRight
	self subclassResponsibility.! !


!classDefinition: #DireccionEste category: 'MarsRover'!
Direccion subclass: #DireccionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:39:45'!
moveBackwards: aPoint
	^ aPoint - (1@0).! !

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:39:37'!
moveFoward: aPoint
	^ aPoint + (1@0).! !

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:31:26'!
nombre
	^ 'E'.! !


!classDefinition: #DireccionNorte category: 'MarsRover'!
Direccion subclass: #DireccionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:39:53'!
moveBackwards: aPoint
	^ aPoint - (0@1).! !

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:39:59'!
moveFoward: aPoint
	^ aPoint + (0@1).! !

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:31:34'!
nombre
	^ 'N'.! !


!classDefinition: #DireccionOeste category: 'MarsRover'!
Direccion subclass: #DireccionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:40:06'!
moveBackwards: aPoint
	^ aPoint + (1@0).! !

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:40:12'!
moveFoward: aPoint
	^ aPoint - (1@0).! !

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:31:43'!
nombre
	^ 'W'.! !


!classDefinition: #DireccionSur category: 'MarsRover'!
Direccion subclass: #DireccionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:40:19'!
moveBackwards: aPoint
	^ aPoint + (0@1).! !

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:40:24'!
moveFoward: aPoint
	^ aPoint - (0@1).! !

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:31:55'!
nombre
	^ 'S'.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coords direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:54'!
coordenadas
	^ coords.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:32:33'!
direccionCardinal
	^ direccion nombre.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:39:06'!
ejecutar: comando
	comando = 'f' ifTrue: [
			coords := direccion moveFoward: coords.
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:32:11'!
initialize
	coords := 0@0.
	direccion := DireccionNorte new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:37:28'!
leerDireccion: aString
	aString = 'N' ifTrue: [^DireccionNorte new].
	aString = 'S' ifTrue: [^DireccionSur new].
	aString = 'W' ifTrue: [^DireccionOeste new].
	aString = 'E' ifTrue: [^DireccionEste new].
	self error: 'Direccion Invalida'.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:12:03'!
setCoordenadas: aPoint
	coords := aPoint.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:37:46'!
setDireccion: aDirection
	direccion := self leerDireccion: aDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:34:28'!
enCoordenadas: aPoint conDireccion: direccion 
	| newMarsRover |
	newMarsRover := MarsRover new.
	newMarsRover setCoordenadas: aPoint.
	newMarsRover setDireccion: direccion.
	^ newMarsRover.! !
