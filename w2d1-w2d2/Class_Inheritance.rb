class Employee
  attr_reader :name, :salary, :title, :boss
  def initialize(name, salary, title, boss)
    @name, @salary, @title, @boss = name, salary, title, boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end


class Manager < Employee
  attr_accessor :employees

  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    self.total_sub_sal * multiplier
  end

  def total_sub_sal
    total = 0
    @employees.each do |employee|
      if employee.is_a? Manager
        total += employee.salary + employee.total_sub_sal
      else
        total += employee.salary
      end
    end
    total
  end

end
#
# ned = Manager.new('Ned', 1000000, 'Founder')
# darren = Manager.new('Darren', 78000, "TA Manager", ned)
# ned.add_employee(darren)
# shawna = Employee.new('shawna', 12000, 'TA', darren)
# david = Employee.new('david', 10000, 'TA', darren)
# darren.add_employee(shawna)
# darren.add_employee(david)
# ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000
