#pasar toda la lista de parametros. 
#por cada una de las opciones q aparezcan en argv, se cojo esa opcion y se pasa a entero
todos = []
pares = []
impares = []
for option in ARGV
  entero = opcion.to_i
  todos << entero
  if entero % 2 == 0
    pares << entero
  else
    impares << entero
  end


p todos
puts "--"
p pares
puts "--"
p impares 

#Siguiente día: bloques, iteradores, diccionarios y expresiones regulares 
end