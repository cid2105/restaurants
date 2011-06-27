module RestaurantsHelper

    def join_tags(restaurant)
      restaurant.tags.map { |t| t.name.strip }.join(", ")
    end

end
