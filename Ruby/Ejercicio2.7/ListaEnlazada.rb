class ListaEnlazada < ListaPuntos
  
  def initialize(puntox, puntoy)
  #  @lPuntos = Array.new # Para hacerlo con un array
    @cabecera = ListaPuntos.new(puntox, puntoy, nil)
  end
  
  def to_s
  end
  
  def insertar (x, y)
  end
  
  def add(val)
    current = @cabecera
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(val, nil)
  end

  def delete(val)
    current.next = @cabecera
    if current.val = val
      @cabecera = current.next
    else
      while (current.next != nil) && (current.next.puntox != val)
        current = current.next
      end
      unless current.next == nil
        current.next = current.next.next
      end
    end
  end

  def return_list
    elements = []
    current = @head
    while current.next != nil
      elements << current
      current = current.next
    end
    elements << current
  end
end

  
  
  
  end
  