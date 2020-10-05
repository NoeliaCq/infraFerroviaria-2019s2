
class VagonPasajeros {
	var property largo = 0
	var property ancho = 0
	var property tieneBanios = true
	var property estaOrdenado = true
	
	
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
	method mantenimiento() { self.estaOrdenado(true) }
}

class VagonCarga {
	var property cargaMaxIdeal = 0
	var property maderasSueltas = 0
	
	method tieneBanios() { return false }
	method capacidad() { return 0 }
	method cantMaxCarga() { return self.cargaMaxIdeal() - self.maderasSueltas() * 400 }
	method pesoMax() { return 1500 + self.cantMaxCarga() }
	method mantenimiento() { maderasSueltas = 0.max(maderasSueltas - 2) }
}

class VagonDormitorio {
	var property compartimientos = 0 
	var property camasPorCompartimiento = 0
	
	method tieneBanios() { return true }
	method capacidad() { return self.compartimientos() * self.camasPorCompartimiento() }
	method cantMaxCarga() { return 1200 }
	method pesoMax() { return 4000 + self.capacidad() * 80 + self.cantMaxCarga() }
	method mantenimiento() { }
}

///variables para consola
/*
 * const pasajeros1 = new VagonPasajeros(largo = 10, ancho = 2, tieneBanios = true, estaOrdenado = true)
 * const pasajeros2 = new VagonPasajeros(largo = 10, ancho = 4, tieneBanios = true, estaOrdenado = true)
 * const carga1 = new VagonCarga(cargaMaxIdeal = 8000, maderasSueltas = 5)
 * const dormi1 = new VagonDormitorio(compartimientos = 12, camasPorCompartimiento = 4)
 * 
 * 
 */












