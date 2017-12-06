require "Alumno"
require "Persona"

p1 = Persona.new("Pepe","Martinez","4/10/1994",23)
a1 = Alumno.new("Pedro Ramon","Moreno Martin","14/11/1990",26,"Ingenieria de Software",22)

puts p1.to_s
puts a1.to_s