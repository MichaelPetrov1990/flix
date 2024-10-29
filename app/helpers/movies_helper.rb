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

  def average_stars(movie)
    if movie.average_stars == 0.0
      content_tag(:strong, "No reviews")
    else
      pluralize(number_with_precision(movie.average_stars, precision: 1) , "star")
    end
  end
end
