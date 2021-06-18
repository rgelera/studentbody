class StudentBody
  include Enumerable
  attr_reader :students

  def initialize
    @students = Hash.new { |h,k| h[k] = [] }
  end

  def add(classname, student)
    @students[classname] << student
  end

  def each
    index = 0
    all_students = @students.values.flatten
    while index < all_students.length
      yield all_students[index]
      index += 1
    end
  end
end