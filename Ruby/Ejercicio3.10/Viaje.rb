class Viaje
  def initialize (origen, destino, duracion)
    @origen, @destino, @duracion = origen, destino, duracion
  end
  
  def to_s
  end
  
  def to_s
    return "#{@origen} -> #{@destino} #{duracion}"
  end
  
  att_reader :origen, :destino, :duracion
  att_writer :origen, :destino, :duracion
  
  
end