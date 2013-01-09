class Movie
  include Mongoid::Document
  include Mongoid::Search

  field :imdb_id, type: String
  validates_uniqueness_of :imdb_id

  field :title, type: String
  field :poster, type: String

  field :plot, type: String
  field :rating, type: Float
  field :year, type: Integer
  field :director, type: String

  search_in :title, :director

  def self.search(search)
    if search.present?
      Movie.full_text_search(search)
    else
      Movie.all
    end
  end
end
