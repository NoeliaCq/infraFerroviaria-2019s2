import vagones.*
import locomotoras.*

class Formacion {
	var property listaVagones = []
	var property listaLocomotoras = []
	
	//vagones
	//method agregarVagon(vagon) { listaVagones.add(vagon) }
	//method agregarLocomotora(loc) { listaLocomotoras.add(loc)}
	method capacidad() { return listaVagones.sum({vagon=> vagon.capacidad()}) }
	method vagonesPopulares() {
		return listaVagones.count({vagon=> vagon.capacidad() > 50 })
	}
	method formacionCarguera() { 
		return listaVagones.all({vagon=> vagon.cantMaxCarga() >= 1000})
	}
	method vagonMasPesado() { return listaVagones.max({vagon=> vagon.pesoMax()}) }
	method pesoVagonMasPesado() { return listaVagones.max({vagon=> vagon.pesoMax()}).pesoMax() }
	method pesoVagonMasLiviano() { return listaVagones.min({vagon=> vagon.pesoMax()}).pesoMax() }
	method dispersionDePesos() {
		return self.pesoVagonMasPesado() - self.pesoVagonMasLiviano()
	}
	method pesoTotalVagones() { return listaVagones.sum({vagon=> vagon.pesoMax()}) }
	method pesoTotalLocomotoras() { return listaLocomotoras.sum({loc=> loc.peso()}) }
	method pesoMax() { 
		return self.pesoTotalVagones() + self.pesoTotalLocomotoras()
	}
	method totalDeBanios() { return listaVagones.count({vagon=> vagon.tieneBanios()}) }
	method mantenimientoDeFormacion() { listaVagones.forEach({vagon=> vagon.mantenimiento()}) }
	method vagonesConPasajeros() { return listaVagones.filter({vagon=>vagon.capacidad() > 0 }) }
	method vagonesSinPasajeros() { return listaVagones.filter({vagon=>vagon.capacidad() == 0})}
	method vagonConMasPasajeros() { 
		return self.vagonesConPasajeros().max({vagon=> vagon.capacidad()})
	}
	method vagonConMenosPasajeros() { 
		return self.vagonesConPasajeros().min({vagon=> vagon.capacidad()})
	}
	method estaEquilibrada() { 
		return self.vagonConMasPasajeros().capacidad() - self.vagonConMenosPasajeros().capacidad() <= 20
	}
	method estaOrdenada() {
		const formacionOrdenada = []
		
		listaVagones.addAll(self.vagonesConPasajeros())
		listaVagones.addAll(self.vagonesSinPasajeros())
		
		return listaVagones == formacionOrdenada
	}
	//locomotoras
	method velocidadMax() { return listaLocomotoras.map({loc=> loc.velocidadMax()}).min() }
	method esEficiente() { return listaLocomotoras.all({loc => loc.esEficiente()}) }
	method puedeMoverse() { return listaLocomotoras.sum({loc => loc.pesoQueArrastra()}) >= self.pesoMax() }
	method arrastreTotalLocomotoras() { return listaLocomotoras.sum({loc => loc.pesoQueArrastra()}) }
	method kgEmpuje() { 
		return if(self.puedeMoverse()) {0} else {self.pesoMax() - self.arrastreTotalLocomotoras()}
	}
	//depósitos
	method esCompleja() { 
		return listaVagones.size() + listaLocomotoras.size() > 8 || self.pesoMax() > 8000
	}
}

/*
 * const forma1 = new Formacion(listaVagones = [pasajeros1, pasajeros2, carga1, dormi1])
 * 
 */











