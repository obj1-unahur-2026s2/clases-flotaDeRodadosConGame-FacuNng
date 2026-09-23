class Corsa{
  const color
  method color() = color
  method capacidad() = 4
  method velocidadMaxima() = 150 
  method peso() = 1300  
}

class Renault{
  const tieneTanque
  const peso = 1200
  method capacidad() {
    if(not tieneTanque){
      return 4
    } else {
      return 3
    }
  } 
  method velocidadMaxima(){
    if(tieneTanque){
      return 120
    } else {
      return 110
    }
  }
  method peso() {
    if(tieneTanque){
      return peso + 150
    } else {
      return peso
    }
  } 
  method color() = "azul" 
}

object trafic{
  var interior = comodo
  var motor = pulenta
  const color = "blanco"

  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.velocidadMaxima()
  method peso() = 4000 + interior.peso() + motor.peso()

  method cambiarInterior(int) {
    interior = int
  }
  method cambiarMotor(mot) {
    motor = mot
  }
  method color() = color 
}

//interiores
object comodo{
  method capacidad() = 5
  method peso() = 700  
}
object popular {
  method capacidad() = 12 
  method peso() = 1000
}

//motores
object pulenta {
  method peso() = 800 
  method velocidadMaxima() = 130
}
object bataton{
  method peso() = 500 
  method velocidadMaxima() = 80
}

class Dependencia{
  const cantidadEmpleados
  const flotaRodados

  method agregarAFlota(unRodado){
    flotaRodados.add(unRodado)
  }
  method  quitarDeFlota(unRodado){
    flotaRodados.remove(unRodado)
  }

  method pesoTotalFlota() = flotaRodados.sum({r => r.peso()})
  method estaBienEquipada() = flotaRodados.size() >= 3 and flotaRodados.all({r => r.velocidadMaxima() >= 100})
  method capacidadTotalEnColor(color) = flotaRodados.filter({r => r.color() == color}).sum({r => r.capacidad()})
  method colorDelRodadoMasRapido() = flotaRodados.max({r => r.velocidadMaxima()}).color()
  method capacidadFaltante() = flotaRodados.sum({r => r.capacidad()}) - cantidadEmpleados
  method esGrande() = flotaRodados.size() >= 5 and cantidadEmpleados >= 40  
}