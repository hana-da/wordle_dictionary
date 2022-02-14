# frozen_string_literal: true

class WordleLookupController < ApplicationController
  def index
    @b = normalized_b_params
    @y = normalized_yg_params(color: :y, count: 5)
    @g = normalized_yg_params(color: :g, count: 1)

    @words = lookup_words
  end

  private def normalized_b_params
    (params[:b] || '').upcase.remove!(/[^A-Z]/).chars.uniq
  end

  private def normalized_yg_params(color:, count:)
    (params[color] || []).map{ _1.upcase.remove!(/[^A-Z]/).first(count) }
  end

  private def lookup_words
    File.readlines('wordle.txt', chomp: true).select do |word|
      no_prohibited_characters_in(word) &&
        all_yellow_chars_in(word) &&
        correct_position_of_yellow_chars_in(word) &&
        correct_position_of_green_chars_in(word)
    end
  end

  private def no_prohibited_characters_in(word)
    !word.match?(Regexp.union(@b))
  end

  private def all_yellow_chars_in(word)
    @y.join.chars.uniq.all? { |y| word.include?(y) }
  end

  private def correct_position_of_yellow_chars_in(word)
    @y.each_with_index.none? { |y, i| word[i] == y }
  end

  private def correct_position_of_green_chars_in(word)
    @g.each_with_index.all? { |g, i| g.blank? || word[i] == g }
  end
end
