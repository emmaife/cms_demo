class Alchemy::EssenceRestaurant < ActiveRecord::Base
  belongs_to :restaurant
  acts_as_essence(ingredient_column: 'restaurant_id'  #associates Alchemy Essence with Active Record Restaurant object
    # Your options:
    #
    # ingredient_column:   [String or Symbol] - Specifies the column name you use for storing the content in the database. (Default :body)
    # validate_column:     [String or Symbol] - Which column should be validated. (Default: ingredient_column)
    # preview_text_column: [String or Symbol] - Specifies the column for the preview_text method. (Default: ingredient_column)
    # preview_text_method: [String or Symbol] - A method called on ingredient to get the preview text. (Default: ingredient_column)
  )
end
