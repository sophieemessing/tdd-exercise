require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    # Arrange
    hand = [2, 5, 3]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 10

  end

  it 'calculates aces as 11 where it does not go over 21' do

    # Act
    hand = [2, 3, 'Ace']

    # Arrange
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 16

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    # Act
    hand = [5, 9, 3, 'Ace']

    # Arrange
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 18

  end

  it 'raises an ArgumentError for invalid cards' do

    hand = ['Ace', 'X', 5]

      expect {
        blackjack_score(hand)
      }.must_raise ArgumentError

    hand = [5, 13]

      expect {
        blackjack_score(hand)
      }.must_raise ArgumentError

  end


  it 'raises an ArgumentError for scores over 21' do

    hand = [6, 7, 8, 9]

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    #edge
    hand = [6, 7, 8, 'Ace']

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'does not accept hands smaller than 2 or greater than 5' do

    hand = [2, 3, 'Ace', 9, 'King', 4]

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = [2]

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

end
