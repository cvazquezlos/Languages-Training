class ListaPuntos 
  def initialize(x, y,siguiente)
    @x, @y, @siguiente = x, y, siguiente
  end
  
  def to_s
    
  end
  
  #getter
  def x
    @x
  end
  
  def y
    @y
  end
  
  def siguiente
    @siguiente
  end
  
  #setter
  def x=(x)
    @x = x
  end
  
  def y=(y)
    @y = y
  end
  
  def siguiente=(siguiente)
    @siguiente = siguiente
  end
  
end