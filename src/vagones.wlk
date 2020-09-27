class Deposito {	//formaciones armadas y locomotoras sueltas
	
}

class Formacion {
	var property composicionFormacion = []
	
	method capacidad() { return self.composicionFormacion().sum({vagon=> vagon.capacidad()}) }
	method vagonesPopulares() {
		return self.composicionFormacion().filter({vagon=> vagon.capacidad() > 50 }).size()
	}
	method formacionCarguera() { 
		return self.composicionFormacion().all({vagon=> vagon.cantMaxCarga() >= 1000})
	}
	method vagonMasPesado() { return self.composicionFormacion().max({vagon=> vagon.pesoMax()}) }
	method vagonMasLiviano() { return self.composicionFormacion().min({vagon=> vagon.pesoMax()}) }
	method dispersionDePesos() {
		return self.vagonMasPesado().pesoMax() - self.vagonMasLiviano().pesoMax()
	}
	method totalDeBanios() { return self.composicionFormacion().filter({vagon=> vagon.tieneBanios()}).size() }
	method mantenimientoDeFormacion() {
		
	}
}

class Locomotora {
	
}

class VagonPasajeros {
	var property largo = 0
	var property ancho = 0
	var property tieneBanios = true
	var property estaOrdenado = true
	//var property pasajerosEnVagon = 0
	
	method capacidad() { 
		if(estaOrdenado) {
			return if(ancho <= 3) { largo * 8 } else { largo * 10 }		
		}
		else { 
			return if(ancho <= 3) { largo * 8 - 15 } else { largo * 10 - 15 }
		}
	}
	method cantMaxCarga() { return if(tieneBanios) {300} else {800} }
	method pesoMax() { return 2000 + self.capacidad() * 80 + self.cantMaxCarga() }
}

class VagonCarga {
	var property cargaMaxIdeal = 0
	var property maderasSueltas = 0
	
	method tieneBanios() { return false }
	method capacidad() { return 0 }
	method cantMaxCarga() { return self.cargaMaxIdeal() - self.maderasSueltas() * 400 }
	method pesoMax() { return 1500 + self.capacidad() }
}

class VagonDormitorio {
	var property compartimientos = 0 
	var property camasPorCompartimiento = 0
	
	method tieneBanios() { return true }
	method capacidad() { return self.compartimientos() * self.camasPorCompartimiento() }
	method cantMaxCarga() { return 1200 }
	method pesoMax() { return 4000 + self.capacidad() * 80 + self.cantMaxCarga() }
}














