require "ProcessManager"
require "Proceso"

pm = ProcessManager.new()
p1 = Proceso.new(1, 0, "init", 450)
p2 = Proceso.new(2, 1, "chrome", 2100)
p3 = Proceso.new(5, 2, "chrome", 1230)
p4 = Proceso.new(3, 0, "print", 500)
p5 = Proceso.new(4, 5, "chrome", 1000)
p6 = Proceso.new(6, 3, "init", 1000)
p7 = Proceso.new(7, 6, "init", 6000)
p8 = Proceso.new(8, 0, "init", 10)
p9 = Proceso.new(9, 0, "init", 600)
p10 = Proceso.new(10, 1, "init", 2300)
p11 = Proceso.new(11, 6, "init", 1000)

pm.addProcess(p1)
pm.addProcess(p2)
pm.addProcess(p3)
pm.addProcess(p4)
pm.addProcess(p5)
pm.addProcess(p6)
pm.addProcess(p7)
pm.addProcess(p8)
pm.addProcess(p9)
pm.addProcess(p10)
pm.addProcess(p11)

value = []
pm.each_process() { |p| value.push(p) }
puts value
puts "---"
value = []
pm.each_child_process(p6) { |p| value.push(p) }
puts value
puts "---"
puts pm.memory()
puts "---"
puts pm.TenMostMemory()