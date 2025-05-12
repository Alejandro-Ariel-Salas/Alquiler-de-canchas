"Filed out from Dolphin Smalltalk 7"!

Object subclass: #TipoCancha
	instanceVariableNames: 'id tipo'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
TipoCancha guid: (GUID fromString: '{57CFCF46-E6CD-4019-A9D3-D5C54D398D1D}')!
TipoCancha comment: ''!
!TipoCancha categoriesForClass!Kernel-Objects! !
!TipoCancha methodsFor!

initTipoid:unid tip:unTip
id := unid.
tipo := unTip.
!

modiTip:unTip
tipo :=unTip.!

verId
^id.!

verTip
^tipo.! !
!TipoCancha categoriesFor: #initTipoid:tip:!public! !
!TipoCancha categoriesFor: #modiTip:!public! !
!TipoCancha categoriesFor: #verId!public! !
!TipoCancha categoriesFor: #verTip!public! !

!TipoCancha class methodsFor!

crearTipoCanchaid: unId tip:unTip
^(self new) initTipoid:unId tip:unTip.! !
!TipoCancha class categoriesFor: #crearTipoCanchaid:tip:!public! !

