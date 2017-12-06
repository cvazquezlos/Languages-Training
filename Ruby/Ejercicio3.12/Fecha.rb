require "Date"

class Fecha
  
  def initialize(f)
    @f = f
  end

  def procesar_fecha (fecha)
    fecha.scan(/(\d) (\D+) (\d) /)
    return Date.new(f[1],f[2],f[3])
  end
    
end