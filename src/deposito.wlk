import locomotoras.*
import vagones.*
import formacion.*

class Deposito {
	var property listaFormaciones = []
	var property listaLocomotoras = []
	
	method usarLocomotoraSuelta(loc) { listaLocomotoras.remove(loc) }
	method vagonesMasPesados() { 
		return listaFormaciones.map({formacion=> formacion.vagonMasPesado()}).asSet()
	}
	method necesitaConductorExp() { return listaFormaciones.any({form=> form.esCompleja()})	}
	method sumarLocomotoraParaMoverFormacion(formacion) {
		const locomotoraUtil = listaLocomotoras.findOrDefault({loc=> loc.pesoQueArrastra() >= formacion.kgEmpuje()}, 0)
		
		if (not formacion.puedeMoverse() && locomotoraUtil != 0) {
			formacion.listaLocomotoras([locomotoraUtil])
			self.usarLocomotoraSuelta(locomotoraUtil)
		}
	}
}