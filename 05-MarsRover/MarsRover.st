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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 12:01:45'!
test04NoSePuedeIniciarMarsRoverConDireccionInvalida
	| marsRover |
	self should: [marsRover := MarsRover enCoordenadas: 1@2 conDireccion: 'p'] raise: Error description: MarsRover direccionInvalidaError.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:30:10'!
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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:07'!
test06MarsRoverRecibeComandoParaAvanzarDireccionSurYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'S'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 2@3 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:14'!
test07MarsRoverRecibeComandoParaAvanzarDireccionOesteYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'W'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 1@4 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:21'!
test08MarsRoverRecibeComandoParaAvanzarDireccionEsteYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'E'.
	comando := 'f'.
	marsRover ejecutar: comando.
	self assert: 3@4 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:28'!
test09MarsRoverApuntandoAlNorteRecibeComandoParaRetrocederYRetrocedeHaciaElSur
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'N'.
	comando := 'b'.
	marsRover ejecutar: comando.
	self assert: 2@3 equals: marsRover coordenadas.
	"En este modelo:
		N = +y
	W= -x        E= +x
		S = -y
	"! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:37'!
test10MarsRoverApuntandoAlSurRecibeComandoParaRetrocederYRetrocedeHaciaElNorte
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'S'.
	comando := 'b'.
	marsRover ejecutar: comando.
	self assert: 2@5 equals: marsRover coordenadas.
	"En este modelo:
		N = +y
	W= -x        E= +x
		S = -y
	"! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:47'!
test11MarsRoverApuntandoAlOesteRecibeComandoParaRetrocederYRetrocedeHaciaElEste
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'W'.
	comando := 'b'.
	marsRover ejecutar: comando.
	self assert: 3@4 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:31:55'!
test12MarsRoverApuntandoAlEsteRecibeComandoParaRetrocederYRetrocedeHaciaElOeste
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'E'.
	comando := 'b'.
	marsRover ejecutar: comando.
	self assert: 1@4 equals: marsRover coordenadas.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:32:10'!
test13MarsRoverApuntandoHaciaElNorteRecibeComandoLeftYGiraHaciaElOeste
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'N'.
	comando := 'l'.
	marsRover ejecutar: comando.
	self assert: 'W' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:32:18'!
test14MarsRoverApuntandoHaciaElNorteRecibeComandoRightYGiraHaciaElEste
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'N'.
	comando := 'r'.
	marsRover ejecutar: comando.
	self assert: 'E' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:32:55'!
test15MarsRoverApuntandoHaciaElSurRecibeComandoLeftYGiraHaciaElEste
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'S'.
	comando := 'l'.
	marsRover ejecutar: comando.
	self assert: 'E' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:33:16'!
test16MarsRoverApuntandoHaciaElSurRecibeComandoRightYGiraHaciaElOeste
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'S'.
	comando := 'r'.
	marsRover ejecutar: comando.
	self assert: 'W' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:33:24'!
test17MarsRoverApuntandoHaciaElOesteRecibeComandoLeftYGiraHaciaElSur
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'W'.
	comando := 'l'.
	marsRover ejecutar: comando.
	self assert: 'S' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:33:41'!
test18MarsRoverApuntandoHaciaElOesteRecibeComandoRightYGiraHaciaElNorte
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'W'.
	comando := 'r'.
	marsRover ejecutar: comando.
	self assert: 'N' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:33:52'!
test19MarsRoverApuntandoHaciaElEsteRecibeComandoLeftYGiraHaciaElNorte
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'E'.
	comando := 'l'.
	marsRover ejecutar: comando.
	self assert: 'N' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:34:02'!
test20MarsRoverApuntandoHaciaElEsteRecibeComandoRightYGiraHaciaElSur
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'E'.
	comando := 'r'.
	marsRover ejecutar: comando.
	self assert: 'S' equals: marsRover direccionCardinal .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:34:19'!
test21MarsRoverRecibeUnComandoDeRotacionYSuPosicionPermaneceIgual
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 4@4 conDireccion: 'E'.
	comando := 'l'.
	marsRover ejecutar: comando.
	self assert: 4@4 equals: marsRover coordenadas .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:57:51'!
test22MarsRoverNoPuedeRecibirUnComandoNoValido
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 4@4 conDireccion: 'E'.
	comando := 'p'.
	self should: [marsRover ejecutar: comando] raise: Error description: Comando comandoInvalidoError.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 12:04:25'!
test23MarsRoverRecibeComandoParaAvanzar2VecesDireccionNorteYAvanza
	| marsRover comando |
	marsRover := MarsRover enCoordenadas: 2@4 conDireccion: 'N'.
	comando := 'ff'.
	marsRover ejecutar: comando.
	self assert: 2@6 equals: marsRover coordenadas.! !


!classDefinition: #Comando category: 'MarsRover'!
Object subclass: #Comando
	instanceVariableNames: 'caracter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Comando methodsFor: 'private' stamp: 'lj 11/18/2021 04:17:14'!
conCaracter: unChar
	caracter := unChar.! !

!Comando methodsFor: 'private' stamp: 'lj 11/18/2021 05:11:32'!
mover: unRobot
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comando class' category: 'MarsRover'!
Comando class
	instanceVariableNames: ''!

!Comando class methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:29:56'!
comandoInvalidoError
	^ 'El carácter ingresado no corresponde a un comando válido'.! !

!Comando class methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 11:55:10'!
conCaracter: unCaracter
	
	unCaracter = $f ifTrue: [^Avance new conCaracter: unCaracter].
	unCaracter = $b ifTrue: [^Retroceso new conCaracter: unCaracter].
	unCaracter = $l ifTrue: [^RotacionIzquierda new conCaracter: unCaracter].
	unCaracter = $r ifTrue: [^RotacionDerecha new conCaracter: unCaracter].
	
	self error: self comandoInvalidoError.
! !


!classDefinition: #Avance category: 'MarsRover'!
Comando subclass: #Avance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Avance methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:08:20'!
mover: unRobot
	unRobot avanzar.! !


!classDefinition: #Retroceso category: 'MarsRover'!
Comando subclass: #Retroceso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Retroceso methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:08:34'!
mover: unRobot
	unRobot retroceder .! !


!classDefinition: #RotacionDerecha category: 'MarsRover'!
Comando subclass: #RotacionDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RotacionDerecha methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:09:59'!
mover: unRobot
	unRobot girarADerecha .! !


!classDefinition: #RotacionIzquierda category: 'MarsRover'!
Comando subclass: #RotacionIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RotacionIzquierda methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:10:16'!
mover: unRobot
	unRobot girarAIzquierda .! !


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

!Direccion methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 04:47:06'!
rotateLeft
	self subclassResponsibility .! !

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

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 04:48:00'!
rotateLeft
	^ DireccionNorte new.! !

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 04:48:29'!
rotateRight
	^ DireccionSur new.! !


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

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 04:48:51'!
rotateLeft
	^ DireccionOeste new.! !

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 04:49:01'!
rotateRight
	^ DireccionEste new.! !


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

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:19:14'!
rotateLeft
	^ DireccionSur new.! !

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:19:25'!
rotateRight
	^ DireccionNorte new.! !


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

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:18:40'!
rotateLeft
	^ DireccionEste new .! !

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:18:27'!
rotateRight
	^ DireccionOeste new .! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coords direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:10:41'!
avanzar
	coords := direccion moveFoward: coords .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/16/2021 12:02:54'!
coordenadas
	^ coords.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:32:33'!
direccionCardinal
	^ direccion nombre.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 12:05:21'!
ejecutar: aString
	| comando |
	1 to: aString size do: [ :index |
			comando := Comando conCaracter: (aString at: index).
			comando mover: self.
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:16:48'!
girarADerecha
	direccion := direccion rotateRight .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:09:37'!
girarAIzquierda
	direccion := direccion rotateLeft .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/17/2021 12:32:11'!
initialize
	coords := 0@0.
	direccion := DireccionNorte new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 12:02:49'!
leerDireccion: aString
	aString = 'N' ifTrue: [^DireccionNorte new].
	aString = 'S' ifTrue: [^DireccionSur new].
	aString = 'W' ifTrue: [^DireccionOeste new].
	aString = 'E' ifTrue: [^DireccionEste new].
	self error: (self class direccionInvalidaError).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:12:45'!
retroceder
	coords := direccion moveBackwards: coords .! !


!MarsRover methodsFor: 'private' stamp: 'lj 11/18/2021 04:38:48'!
mirarHacia: unaDireccion
	direccion := self leerDireccion: unaDireccion.! !

!MarsRover methodsFor: 'private' stamp: 'lj 11/18/2021 05:34:52'!
posicionarInicialmenteEn: unPunto
	coords := unPunto.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IB 11/18/2021 12:02:17'!
direccionInvalidaError
	^ 'Direccion Invalida'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'lj 11/18/2021 05:35:05'!
enCoordenadas: aPoint conDireccion: direccion 
	| newMarsRover |
	newMarsRover := MarsRover new.
	newMarsRover posicionarInicialmenteEn: aPoint.
	newMarsRover mirarHacia: direccion.
	^ newMarsRover.! !
