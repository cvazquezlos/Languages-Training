require "Pila"

#Voy a ir al programa principal y usar los metodos de la pila como si existieran. Luego se implementan los metodos

p = Pila.new()

puts p.empty?
#esta vacia?

p.apilar(5)
puts p.empty?

p.apilar(10)
x= p.desapilar()
puts "x==10? -> #{x}"

y = p.cima #consulto la cima
puts "y==10? -> #{y}"

puts p.size

p.apilar(10)


puts p


