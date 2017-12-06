require "Fraccion"

#Normalmente no se prueba con un script sino con tests

f1 = Fraccion.new(2,5)
f2 = Fraccion.new(5,3)

puts f1.esMayor(f2)
puts f1.esMenor(f2)
puts f1.esEquivalente(f2)

f3 = Fraccion.new(20,50)
puts f1.esEquivalente(f3)

