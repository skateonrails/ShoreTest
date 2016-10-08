#question_2.rb
class Foo
  class << self
    def method_missing(method)
      print method
    end
  end
end
