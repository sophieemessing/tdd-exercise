# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0

  if hand.length < 2 || hand.length > 5
    raise ArgumentError.new("hand must be between 2 and 5 cards")
  end

  hand.each do |card|
    case card
    when 'Jack', 'Queen', 'King'
      card = 10
    when 'Ace'
      card = 1
    when (2..9)
      card = card
    else
      raise ArgumentError.new("#{card} is not a valid card!")
    end
    score += card
  end

  if hand.include?('Ace') && score <= 10
    score = score + 10
  end

  if score <= 21
    return score
  else
    raise ArgumentError.new("#{score} is greater than 21. BUST!")
  end

end


