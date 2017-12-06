##Creamos array de fracciones.

#Se ordena, y se imprimen

require "Fraccion"
f1 = Fraccion.new(1,2)
f2 = Fraccion.new(1,3)

x= [f1, f2]

y = x.sort()

puts x
puts "..." 
puts y

#Se apoy en el operador para ordenarlos