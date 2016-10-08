# question_1.rb
# one-line answer: input.group_by{|obj| obj}.inject({}){|memo, aray| memo[aray.first] = aray.last.count; memo}
class CharacterFrequency
  class InvalidParameter < StandardError
  end

  def initialize(input=[])
    raise InvalidParameter unless input.is_a?(Array)
    @input = input
  end

  def to_hash
    group_input.inject(Hash.new) do |memory, group_array|
      key = group_array.first
      value = group_array.last
      memory[key] = value.count
      memory
    end
  end

  private
  def group_input
    @input.group_by{|element| element}
  end
end
