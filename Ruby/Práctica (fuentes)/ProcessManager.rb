require "Proceso"

class ProcessManager
  def initialize()
    @processes = Array.new
    @childTree = Hash.new
    @memoryCount = Hash.new
  end

  def addProcess(process)
    (@processes.push process) if !@processes.include?(process)
    
    if process.parentId == 0
      @childTree[process.id] = []
      @childTree[process.id].push process
    else
      @childTree.each_pair {|key, value| @childTree[key].push(process) if value.include? self.parent(process) }
    end
    
    name = process.name
    @memoryCount[name] = 0 if !@memoryCount.key?(name)
    @memoryCount[name] = @memoryCount[name] + process.memory
  end

  def parent(process)
    @childTree.values().each { |dep| dep.each { |i| return i if i.id == process.parentId } }
  end

  def each_process()
    @processes.each() do |i|
      yield i
    end
  end

  def each_child_process(process)
    processes = []
    @childTree.each_pair { |key, value| (processes=value) if value.include?(process) }
    processes.drop(processes.index(process)+1).each() do |i|
      yield i
    end
  end
  
  def memory()
    return @memoryCount
  end
  
  def TenMostMemory()
    sorted = @processes.sort_by { |process| process.memory }.reverse
    (sorted.length<10) ? (return sorted) : (return sorted.first(10))
  end

end