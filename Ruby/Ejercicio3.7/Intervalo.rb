class Intervalo
  # asignamos los valores a los atributos del objeto. A la iziquierda, nombre del atributo en rojo
  def initialize(inicio, fin)
    @inicio, @fin = inicio, fin
  end

#método to_String. Genera un String que puedo imprimir por pantalla. 
#En el objeto de esta clase se hara un puts del objeto
def to_s
  "(#{@inicio}, #{@fin})"
end

def length 
  @fin - @inicio
end

def contains (number)
  @inicio <= number && number <= @fin
end

# Necesito implementar un método get para implementar el get
def equals (otro)
  otro.inicio == @inicio && otro.fin == @fin
end

def desplazar #No se modifica el estado del objeto. Es interesante para prog concurrente
 # Intervalo.new(#{@inicio}, #{@fin})
end

def desplazar!(desplazamiento) #Metodos destructivo. Modifica el estado del objeto
  @fin = @fin + desplazamiento
  @inicio = @inicio + desplazamiento
end

#metodos get
def inicio
  return @inicio
end

#Funcion que alargue los intervalos en un numero x. Se modifica el extremo superior de cada uno de los intervalos en 10 unidades

def aumentar! (v)
  @fin=@fin+v
  #return self
end
#no escribir attr_accesor para atributos en la práctica

def fin
  return @fin
end

end