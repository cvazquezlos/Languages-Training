require "Intervalo"

def each_con_indice(o)
    #Va a recorrer el array, pasandole el bloque correspondiente
    for i in 0..o.size()-1
      yield(i,o[i])
    end  
end

i1 = Intervalo.new(2,5)
i2 = Intervalo.new(0,25)
i3 = Intervalo.new(7,13)
i4 = Intervalo.new(-2,9)
i5 = Intervalo.new(8,17)

x=[i1,i2, i3]
x.push(i4) #Inserta en el array
x<<i5      #Introduce por el final

#Recorrer cada uno de los intervalos
x.each() { | i | if i.long() <10 then
  puts i  
end} # Es un bloque

capitales = %w{Tirana Viena Baku Bruselas Roma Bratislava Lisboa}
#Otra forma de declarar un array, sin , ni ""

capitales.sort!

#Se sustituye con el yield, primero la posicion y luego el valor. 
#Donde pone el yield se sustituye lo que hemos definido como bloque: (valor, posicion)
each_con_indice(capitales) { |posicion,valor|
    puts "Elemento #{valor} en posicion #{posicion}"
}
