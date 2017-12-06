class Pila
  def initialize()
    @lista = []
  end
  
  #Se deja privado y no se usa att_reader y att_writer
  
  def to_s
    x = @lista.reverse()
    x.to_s
  end
  
  def apilar (elemento)
  #  @lista << elemento #meter un elemento al final de la lista
    @lista.push(elemento)
  end
  
  def desapilar
    @lista.pop
  end
  
  def cima 
    #Devuelve el elemento que esta al final pero no lo elimina de la lista
    @lista[-1]
  end
  
  def size
    @lista.length()
  end
  
  def empty?
    @lista.empty?()
  end
end