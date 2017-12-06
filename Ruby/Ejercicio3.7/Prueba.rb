require "Intervalo"

def aumentar (intervalos)
  for i in 0..o.size()-1
    aumento = intervalos.collect {| intervalos | intervalos + 10 }
  end  
end

i1 = Intervalo.new(2,5)
i2 = Intervalo.new(0,25)
i3 = Intervalo.new(7,13)
i4 = Intervalo.new(-2,9)
i5 = Intervalo.new(8,17)

x=[i1,i2, i3,i4,i5]

longitudes = x.collect{|interv| interv.long}
#al intervalo, se le pasa el metodo 

p longitudes
suma= 0
longitudes.each{|interv| suma= suma + interv}
puts suma
l.each {|interv| interv.aumentar!(10)}
puts i  


