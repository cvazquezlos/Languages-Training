class StringUtil
  
  def invertir(cadenas)
    #recorrer el array de strings cadena, y cada uno de ellos se va dando la vuelta
    resultado = []
    #Se almacena en resultado. A resultado se le inserta al final la cadena c invertida
  cadenas.each{|c|  resultado << c.reverse()}
  # El each es el iterador más utilizado
    
  def split (cadena)
  return cadena.collect {|palabra| palabra.split(" ")}
  end
  
  def fin (cadena, buscamos)
    return cadena.find {|palabra| palabra.include?buscamos}
  end
  
  #fin recorre una coleccion de elementos y deuelve la primera coleccion que encuentre.
  #si no encuentra ningun elemento que cumple la condicion devuelve un nil
  end
  
  
  
  
end

#Main. Debe ir en otro fichero

capitales = %w{Tirana Viena Baku Bruselas Roma Bratislava Lisboa}
sU = StringUtil.new()
p sU.invertir(capitales) #Se puede escribir p o puts