module RatingsHelper
  def ratings_block(type, type_id, user_id)
    @rating = Rating.where('rating_type = ? AND type_id = ? AND user_id = ?', type, type_id, user_id).first
    if !@rating
      @rating = Rating.new
      @rating.rating_type = type
      @rating.type_id = type_id
      @rating.user_id = user_id
    end

    # Assuming the '_form' partial is in a directory 'app/views/ratings'
    render :partial => "ratings/form", :locals => {:rating => @rating}
  end

  def ratings_average_block(type, type_id)
    @average = Rating.where('rating_type = ? AND type_id = ?', type, type_id).average("value")

    if !@average
      @average = 0.0
    end

    # Assuming the '_form' partial is in a directory 'app/views/ratings'
    render :partial => "ratings/average", :locals => {:average => @average}
  end
end
