require "Viaje"

class GestorViajes
  def intialize (viajes)
    @viajes = []
    @viajesPorOrigen=Hash.new()
    @viajesPorDestino=Hash.new()  
  end
  
  def darAlta (viaje)
    @viajes << viaje
    addDiccionario(@viajesPorOrigen,viaje.origen)
    addDiccionario(@viajesPorOrigen,viaje.destno)
  end
  
  def viajeOrigen(origen)
    return @viajesPorOrigen[origen]
  end  
  private
  
  def addDiccionario (diccionario,origen,v) #dccionario, clave y valor que va a insertar
    if (diccionario.include?(origen)) #si existe la clave, se mete el valor en array
      diccionario[origen]<<v
    else
      diccionario[origen]=[v]  #si no existe la clave, se crea el array
    end
  end
  
end