# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/core_ext/string'

get '/' do
  @b = normalized_string_param(params[:b])
  @y = normalized_array_param(params[:y], each_length: 5)
  @g = normalized_array_param(params[:g], each_length: 1)

  @words = lookup_words

  haml :index
end

using CoreExt::String

# @return [Array]
private def normalized_string_param(param)
  String(param).upcase.remove!(/[^A-Z]/).chars.uniq
end

# @return [Array]
private def normalized_array_param(param, each_length:)
  Array(param).map{ _1.upcase.remove!(/[^A-Z]/).first(each_length) }
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
