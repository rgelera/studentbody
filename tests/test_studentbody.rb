require 'minitest/autorun'
require_relative '../studentbody'

class TestStudentBody < Minitest::Test

  def test_add
    studentbody = StudentBody.new
    studentbody.add("math", "student 1")
    assert_equal(["student 1"], studentbody.students["math"])
  end

  def test_iterating_using_each
    studentbody = StudentBody.new
    studentbody.add("math", "student 1")
    studentbody.add("math", "student 2")
    studentbody.add("math", "student 3")
    studentbody.add("science", "student 4")
    studentbody.add("science", "student 5")
    studentbody.add("english", "student 6")

    arr = []
    studentbody.each { |student|
      arr << student
    }
    assert_equal(["student 1", "student 2", "student 3", "student 4", "student 5", "student 6" ], arr)
  end

  def test_each_empty
    studentbody = StudentBody.new
    arr = []
    studentbody.each { |student|
      arr << student
    }
    assert_equal([], arr)
  end
  
  def test_map
    studentbody = StudentBody.new
    studentbody.add("math", "student 1")
    studentbody.add("math", "student 2")
    studentbody.add("math", "student 3")
    studentbody.add("science", "student 4")
    studentbody.add("science", "student 5")
    studentbody.add("english", "student 6")
    assert_equal(["student 1 mapped", "student 2 mapped", "student 3 mapped", "student 4 mapped", "student 5 mapped", "student 6 mapped"], studentbody.map { |student| "#{student} mapped" })
  end

  def test_find_all
    studentbody = StudentBody.new
    studentbody.add("math", "Alex A")
    studentbody.add("math", "Kim L")
    studentbody.add("math", "Sarah B")
    studentbody.add("science", "Derek N")
    studentbody.add("science", "Daniel H")
    studentbody.add("english", "Alex B")
    assert_equal(["Alex A", "Alex B"], studentbody.find_all { |student| student.start_with?("Alex") } )
  end
end