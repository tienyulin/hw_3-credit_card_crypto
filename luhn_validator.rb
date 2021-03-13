module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit

    odd_index_num = nums_a.reverse_each.select.with_index { |_, i| i.even? }
    odd_total = odd_index_num.sum

    even_index_num = nums_a.reverse_each.select.with_index { |_, i| i.odd? }
    even_index_num = even_index_num.map { |n| n * 2 > 9 ? n * 2 - 9 : n * 2 }
    even_total = even_index_num.sum

    ((odd_total + even_total) % 10).zero?
  end
end
