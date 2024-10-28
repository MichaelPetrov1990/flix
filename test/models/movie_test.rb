require "test_helper"

class MovieTest < ActiveSupport::TestCase

  test "should create a valid movie" do
    movie = Movie.create!(title: "something")
    
    assert movie.valid?
    assert_equal "something", movie.title
  end

  test "movie#flop? returns true of box office less than 100 mil" do
    movie = Movie.create!(title: "something", total_gross: 10^10)

    assert movie.flop?
  end
end
