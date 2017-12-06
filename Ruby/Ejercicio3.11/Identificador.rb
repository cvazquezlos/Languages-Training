class Identificador
  def intialize (nif)
    #Sin guion
     @numero = id [0..-2].to_i
     @letra = id [-1]
    # Con guion
     partes = id.split('-')
     @numero = partes[0].to_i
     @letra = partes [1]
  end
  
  def to_s
    "(#{@nif})"
  end
  
end