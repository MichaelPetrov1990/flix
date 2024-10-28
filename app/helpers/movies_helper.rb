module MoviesHelper
  def box_office_or_flop(movie)
    if movie.flop?
      'FLOP'
    else
      number_to_currency(movie.total_gross, precision: 0, unit: "£")
    end
  end

  def formatted_release_date(movie)
    if movie.released_on
      movie.released_on.strftime("%Y")
    else
      "Release date not available"
    end
  end
end
