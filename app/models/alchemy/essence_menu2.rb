class Alchemy::EssenceMenu2 < ActiveRecord::Base
  belongs_to :menu
  belongs_to :restaurant
  acts_as_essence(ingredient_column: 'menu_id'
    # Your options:
    #
    # ingredient_column:   [String or Symbol] - Specifies the column name you use for storing the content in the database. (Default :body)
    # validate_column:     [String or Symbol] - Which column should be validated. (Default: ingredient_column)
    # preview_text_column: [String or Symbol] - Specifies the column for the preview_text method. (Default: ingredient_column)
    # preview_text_method: [String or Symbol] - A method called on ingredient to get the preview text. (Default: ingredient_column)
  )
# before_save :set_name
attr_accessor :menu_updated
after_update :create_menu, unless: :menu_updated
after_find :delete_menu_if_trashed
# after_update :update_menu


def create_menu
  # if content.ingredient.nil?
  @menu = Menu.find_by(id: self.menu_id)
  if @menu.nil?
    @menu = Menu.create(name: content.essence.name, restaurant_id: content.essence.restaurant_id)
  else
    @menu.update(name: content.essence.name, restaurant_id: content.essence.restaurant_id)
  end
  self.menu_updated = true
  self.update(menu_id: @menu.id)
  end

  def delete_menu_if_trashed
    @menu = Menu.find_by_id(self.menu_id)
    if self.content.element.trashed? && !@menu.nil? 
        @menu.destroy
    end
  end




#   def update_menu
#     @menu = Menu.find_by_id(content.ingredient)
#     @menu.update(name: self.name, restaurant_id: content.ingredient)
#   end





end
