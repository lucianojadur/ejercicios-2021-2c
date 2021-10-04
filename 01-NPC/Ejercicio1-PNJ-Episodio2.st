!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: 'interacciones dialogos'!

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:02:15'!
actualizarRecuentoDeInteraccionesCon: unPersonaje siInteractuaron: cantidadDeVeces
	((interacciones at: unPersonaje) = cantidadDeVeces) ifTrue: [
		interacciones at: unPersonaje put: 0.
		TreborElGuardiaDeSkyrim reiniciarHiloCon: unPersonaje.
		].! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:37:11'!
cambiarOpinionSobre: unPersonaje siInteractuaron: cantidadDeVeces
	((interacciones at: unPersonaje) = cantidadDeVeces) ifTrue: [
		Riverwood verComoPrometedorA: unPersonaje.
	]
	! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 14:48:53'!
consultarARiverwoodSobre: unPersonaje
	^ Riverwood opinionSobre: unPersonaje.! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 15:54:02'!
inicializar
	dialogos at: 'desconocido' put: #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme').
	dialogos at: 'prometedor' put: #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme').
	^ self .! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:40:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	interacciones := ((Dictionary new) add: (#Hamilton->3); yourself).
	dialogos := ((Dictionary new) add: ('desconocido'->#('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )); add: ('prometedor'->#('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' )); yourself).! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 16:53:41'!
interactuarCon: unPersonaje
	|cantidadDeInteracciones mensaje|
	interacciones at: unPersonaje ifAbsentPut: 0.
	self actualizarRecuentoDeInteraccionesCon: unPersonaje siInteractuaron: 3.

	cantidadDeInteracciones := (interacciones at: unPersonaje) + 1.
	interacciones at: unPersonaje put: cantidadDeInteracciones.
	mensaje := self responderSegun: cantidadDeInteracciones aAlguienConsiderado: (Riverwood opinionSobre: unPersonaje).
	
	self cambiarOpinionSobre: unPersonaje siInteractuaron: 3.
	^mensaje.! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/3/2021 19:06:04'!
olvidarInteracciones
	interacciones := Dictionary new .! !

!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:05:32'!
responderSegun: cantidadDeInteracciones aAlguienConsiderado: valoracion .
	^ (dialogos at: valoracion) at: cantidadDeInteracciones .! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'lj 10/4/2021 16:36:29'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'lj 10/4/2021 15:54:19'!
carolinaLaCurandera
	^ CarolinaLaCurandera inicializar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'lj 10/4/2021 10:33:39'!
hamilton
	^#Hamilton .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'lj 10/4/2021 10:35:57'!
tirion
	^#Tirion .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'lj 10/4/2021 17:15:08'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim inicializar.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'lj 10/4/2021 16:57:50'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^['prometedor' = (Riverwood opinionSobre: unPersonaje)] .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'lj 10/3/2021 19:06:33'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCurandera olvidarInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'lj 10/4/2021 15:14:45'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood olvidarCalificaciones .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'lj 10/4/2021 10:42:13'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^ Riverwood verComoPrometedorA: self hamilton .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'IB 10/3/2021 18:06:44'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'lj 9/30/2021 18:39:44'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 20:52:29'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 21:08:21'!
tirion
	^ #Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'lj 10/4/2021 17:14:49'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim inicializar.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'IB 10/3/2021 18:05:04'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'lj 10/4/2021 17:21:09'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	"(self treborElGuardia)"Riverwood olvidarCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'lj 10/4/2021 17:20:43'!
hacerQueRiverwoodVeaPrometedorAHamilton
	"(self TreborElGuardia)"Riverwood verComoPrometedorA: (self hamilton).! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: 'personajes'!

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:40:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	personajes := ((Dictionary new) add: (#Hamilton->'prometedor'); yourself).! !

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 15:16:07'!
olvidarCalificaciones
	personajes := Dictionary new .! !

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 15:55:48'!
opinionSobre: unPersonaje
 	personajes at: unPersonaje ifAbsent: [personajes at: unPersonaje put: 'desconocido'] .
	^ personajes at: unPersonaje .! !

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:34:02'!
verComoPrometedorA: unPersonaje
	personajes at: unPersonaje put: 'prometedor'.
	TreborElGuardiaDeSkyrim reiniciarHiloCon: unPersonaje.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'dialogos interacciones'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'lj 10/4/2021 17:14:26'!
interactuarCon: unPersonaje
	|cantidadDeInteracciones|
	interacciones at: unPersonaje ifAbsentPut: 0.

	cantidadDeInteracciones := (interacciones at: unPersonaje) + 1.
	interacciones at: unPersonaje put: cantidadDeInteracciones.
	^ self responderSegun: cantidadDeInteracciones aAlguienConsiderado: (Riverwood opinionSobre: unPersonaje) .! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'IB 10/3/2021 18:04:50'!
olvidarInteracciones
	interacciones := Dictionary new.! !



!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:15:32'!
inicializar
	dialogos at: 'desconocido' put: #('Hola forastero' '¿Todo bien?' '¿Algún problema?').
	dialogos at: 'prometedor' put: #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood').
	^self.	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:40:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	dialogos := ((Dictionary new) add: ('desconocido'->#('Hola forastero' '¿Todo bien?' '¿Algún problema?' )); add: ('prometedor'->#('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' )); yourself).
	interacciones := ((Dictionary new) add: (#Hamilton->1); add: (#Tirion->0); yourself).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'IB 10/3/2021 18:08:36'!
olvidarOpiniones
	dialogos := Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:02:28'!
reiniciarHiloCon: unPersonaje
	interacciones at: unPersonaje put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'lj 10/4/2021 17:28:48'!
responderSegun: cantidadDeInteracciones aAlguienConsiderado: valoracion .
	^ (dialogos at: valoracion) at: (cantidadDeInteracciones min: (dialogos at: valoracion) size).! !

CarolinaLaCurandera initializeAfterFileIn!
Riverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!