require "Persona"

class Alumno < Persona
  def initialize(nombre, apellidos, f_nacimiento, edad, titulacion, n_matricula)
    super(nombre, apellidos, f_nacimiento, edad)
    @titulacion = titulacion
    @n_matricula = n_matricula
  end
  
  def to_s
    super + "(#{@titulacion}, #{@n_matricula})"
  end
  
  def titulacion
    return @titulacion
  end
  
  def n_matricula
    return @n_matricula
  end
    
  #Cuando me tengo que pasar como parámetro en un método, o para poder distinguir entre una llamada
  #Mía y de otro sitio, se utiliza la palabra reservada self para acceder a los atributos
  #No se puede cualificar los atributos con el self
  
  #Anadir metodos en tiempos de ejecuccion. Para poder procesar eventos en objetos
end