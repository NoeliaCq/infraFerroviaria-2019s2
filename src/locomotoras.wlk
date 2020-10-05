import deposito.*
class Locomotora {
	var property peso = 0
	var property pesoQueArrastra = 0
	var property velocidadMax = 0
	
	method esEficiente() { return pesoQueArrastra >= peso * 5 }
}


/*
 * const loc1 = new Locomotora(peso=1000, pesoQueArrastra=20000, velocidadMax=60)
 * const loc2 = new Locomotora(peso=1800, pesoQueArrastra=50000, velocidadMax=40)
 */