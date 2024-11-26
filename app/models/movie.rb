class Movie < ApplicationRecord

  before_save :set_slug

  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  validates :title, :released_on, :duration, presence: :true
  validates :title, presence: true, uniqueness: true
  validates :description, length: { minimum: 25}

  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :rating, inclusion: { 
    in: RATINGS,
    message: "Needs to be a valid rating" 
  }

  scope :released, -> { where("released_on < ?", Time.now).order("released_on desc") }
  scope :upcoming, -> { where("released_on > ?", Time.now).order("released_on asc") }
  scope :recent, ->(limit=5) { released.limit(limit) }
  scope :hits, -> { released.where("total_gross >= 300000000").order(total_gross: :desc) }
  scope :flops, -> { released.where("total_gross < 225000000").order(total_gross: :asc) }
  
  def flop?
    total_gross < 100000000
  end

  def average_stars
    if reviews.present?
      reviews.average(:stars).to_s
    else
      0.0
    end
  end

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
