class Habitacion {

	var property duenios = #{ }
	var property ocupantes = #{}
	
	method nivelDeConfort(persona) {
		return 10 + self.nivelDeConfortExtra(persona)
	}
	method hacerDuenio(persona) {
		duenios.add(persona)
	}
	method esDuenio(persona){
		return self.duenios().contains(persona)
	}
	method nivelDeConfortExtra(persona)
	
	method estaOcupada() {
		return ocupantes.size()>0
	}
	
	method ingresarAHabitacion(persona) {
		if (not self.estaOcupada()){
			ocupantes.add(persona)
		}
		else if (self.puedeIngresar(persona)) {
			ocupantes.add(persona)
		}
		else {self.error("no cumple con los requisitos")}  
	}
	method puedeIngresar(persona)
}

class UsoGeneral inherits Habitacion {
	override method nivelDeConfortExtra(persona) {
		return 0
		
		}
	override method puedeIngresar(persona) {
		return true
	}
	
	
}

class Banio inherits Habitacion {

	override method nivelDeConfortExtra(persona) {
		if (persona.edad() >= 4) {
			return  + 2
		} else {
			return + 4
		}
	}
	override method puedeIngresar(persona) {
		return ocupantes.any({p => p.edad()<=4})
	}

}

class Dormitorio inherits Habitacion {

	override method nivelDeConfortExtra(persona) {
		if (self.esDuenio(persona)){
			return 10 / self.duenios().size()
		}
		else {return 0}
	}
	override method puedeIngresar(persona) {
		return self.esDuenio(persona) or ocupantes.intersection(duenios).equals(duenios)
	}

}


class Cocina inherits Habitacion{
	var property metrosCuadrados = 0
	override method nivelDeConfortExtra(persona){
		if (persona.tieneHabilidadesDeCocina()) {
			return self.metrosCuadrados() * planoDeCocina.porcentaje()
		}
		else (return 0)
		
	}
	override method puedeIngresar(persona) {
		return ocupantes.any({p => p.tieneHabilidadesDeCocina() })
	}
}

object planoDeCocina {
	var property porcentaje =0.10
}
