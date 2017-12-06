#Ejercicio 3.10
=begin
	Implementar una aplicación que permita gestionar un 
	conjunto de viajes de una aerolínea. Cada viaje se 
	representa con la ciudad origen, destino y la duración 
	del viaje (clase Viaje). Los viajes se dan de alta en un gestor 
	(clase GestorViajes). Al gestor de viajes se le puede pedir:
 		- Añadir un viaje nuevo
		- Devolver todos los viajes que tienen una determinada ciudad origen
		- Devolver todos los viajes que tienen una determinada ciudad destino
		- Devolver todos los viajes cuya duración no supere un determinado límite
	Hay que conseguir el menor tiempo de ejecución de las consultas, aunque sean necesarias varias estructuras de datos.

=end

class Viaje

	def initialize (origen, destino, duracion)
		@origen, @destino, @duracion = origen, destino,duracion
	end

	def to_s
		return "#{@origen} -> #{@destino} : #{@duracion} en horas"
	end

	attr_reader :origen, :destino, :duracion

end

#------------------------------------------------------------
require 'Viaje'
class GestorViajes

	def initialize ()
		@viajes = []
		@viajesPorOrigen = Hash.new()
		@viajesPorDestino = Hash.new()
	end

	def to_string
		"#{@viajes}"
	end

	def viajeOrigen (origen)
		return @viajesPorOrigen[origen]
	end

	def addViaje (viaje)
		@viajes<<viaje
		addDiccionario(@viajesPorOrigen,viaje.origen,viaje)
		addDiccionario(@viajesPorDestino,viaje.destino,viaje)
		end

	# si el destino ya esta que no lo haga es privado
	private
	def addDiccionario(diccionario,origen,v)
		if diccionario.include?(origen)
			diccionario[origen] << v
		else
			diccionario[origen] = [v]
		end
	end

# la idea de las estructuras es la siguiente
# se crea el objeto viaje que sera apuntado por dos punteros, el trayecto es bidireccional
# ejemplo de agregar MAdrid- Valencia - 1h
# 					 Madrid - Kiev -5h
#
# 	viaje[(madrid,Valencia,1), (madrid,Kiev,5)]
#
# 	viaje destino{    (tablas hash)
# 					"valencia" 	-> [madrid,valencia,1]
# 					"kiev"		-> [madrid,kiev,5]
#				}
# 	viaje Origen{ 		(tabla hash)
#					"madrid" 	-> [madrid,valencia,1], [madrid,kiev,5]
# 				}

	def viajesDuracion(limite)
		return @viajes.find_all(){|v|
									v.duracion<limite}
	end








end