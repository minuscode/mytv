module MoviesHelper
  def movie_photo(photo_url, html_options={})
    url = photo_url.present? ? photo_url : asset_path("missing.png")
    image_tag url, html_options
  end
end
