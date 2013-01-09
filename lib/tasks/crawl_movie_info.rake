namespace :mytv do
  desc "Crawls some movies from imdb to our db"
  task :crawl_movie_info => :environment do
    
    puts "*************************************************************************************"
    puts "Crawls some movie info from imdb to our db"
    puts "*************************************************************************************"

    movie_queries = %w(Batman Star\ Wars Kill\ Bill)
    movie_queries.each do |search|
      results = Imdb::Search.new(search) 
      results.movies.each do |movie|
        # Avoids dupes
        Movie.find_or_create_by(
          imdb_id: movie.id,
          title: movie.title,
          poster: movie.poster,
          plot: movie.plot,
          rating: movie.rating,
          year: movie.year,
          director: movie.director
        )
      end
    end
    
    puts "*************************************************************************************"
    
    
  end
  
end

