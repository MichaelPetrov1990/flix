class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user

  validates :title, :released_on, :duration, presence: :true

  validates :description, length: { minimum: 25}

  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :rating, inclusion: { 
    in: RATINGS,
    message: "nMeeds to be a valid rating" 
  }

  def flop?
    total_gross < 100000000
  end

  def self.released
    Movie.where("released_on < ?", Time.now).order("released_on desc")
  end

  def average_stars
    if reviews.present?
      reviews.average(:stars).to_s
    else
      0.0
    end
  end
end
