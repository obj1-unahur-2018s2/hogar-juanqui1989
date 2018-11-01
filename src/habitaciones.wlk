class Habitacion {

	var property duenios = #{ }

	method nivelDeConfort(persona) {
		return 10
	}
	method esDuenio(persona){
		return self.duenios().contains(persona)
	}

}

class UsoGeneral inherits Habitacion {

}

class Banio inherits Habitacion {

	override method nivelDeConfort(persona) {
		if (persona.edad() >= 4) {
			return super(persona) + 2
		} else {
			return super(persona) + 4
		}
	}

}

class Dormitorio {

	override method nivelDeConfort(persona) {
		if (self.esDuenio(persona)){
			return 10 - self.duenios().count()
		}
		else {return 0}
	}

}

