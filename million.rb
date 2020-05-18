SEARCH_DEPTH = 1000

def bank_balance(first_deposit, second_deposit)
  balance = Hash.new { |h,k| h[k] = h[k-1] + h[k-2] }
  balance[0] = first_deposit
  balance[1] = first_deposit + second_deposit

  return balance
end

winners = {}

(1..SEARCH_DEPTH).each do |a|
  (1..SEARCH_DEPTH).each do |b|
    balance = bank_balance(a, b)
    i=0

    until balance[i] >= 1_000_000
      i += 1
    end

    if balance[i] == 1_000_000
      winners[[a,b]] = i
    else
      # puts "{#{a},#{b}} stopped after #{i} steps at #{balance[i]}"
    end
  end
end

puts winners