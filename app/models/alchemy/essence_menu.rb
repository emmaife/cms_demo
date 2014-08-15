class Alchemy::EssenceMenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :restaurant
  acts_as_essence(ingredient_column: 'menu_id',
   
    # Your options:
    #
    # ingredient_column:   [String or Symbol] - Specifies the column name you use for storing the content in the database. (Default :body)
    # validate_column:     [String or Symbol] - Which column should be validated. (Default: ingredient_column)
    # preview_text_column: [String or Symbol] - Specifies the column for the preview_text method. (Default: ingredient_column)
    # preview_text_method: [String or Symbol] - A method called on ingredient to get the preview text. (Default: ingredient_column)
  )
  attr_accessor :menu_parsed
  after_update :parse_menu_text, unless: :menu_parsed



def parse_menu_text

  @menu = Menu.find_by(id: self.menu_id)
    if !@menu.nil? 
      @menu.destroy
    end
  
  # @menu_category = MenuCategory.find_by(id: self.menu_id)
  # @menu_item = MenuItem.find_by(@menu_item.id)
  menu_arr = self.menu_text.split(/\n/)

  menu_arr.each do |item|
      if item == menu_arr[0]
        @menu = Menu.create(name: item, restaurant_id: content.essence.restaurant_id)
      elsif item.include?(':')
        @menu_category =  MenuCategory.create(name: item.split(":").first, menu_id: @menu.id)
      elsif item.include?('-')
        menu_item_and_price = item.split('-')
        @menu_items = MenuItem.create(name: menu_item_and_price[0], price: menu_item_and_price[1], menu_category_id: MenuCategory.last.id) 
      end
    end
    self.menu_parsed = true
    self.update(menu_id: @menu.id)

end
#     end
#   else
#     if item == menu_arr[0]
#         @menu.update(name: item, restaurant_id: content.essence.restaurant_id)
#       elsif item.include?(':')
#         @menu_categories = @menu.menu_categories
#         @menu_categories.each do |menu_category|

#         @menu_category.where(name: item.split(":").first, menu_id: Menu.last.id)
#       elsif item.include?('-')
#         menu_item_and_price = item.split('-')
#         MenuItem.create(name: menu_item_and_price[0], price: menu_item_and_price[1], menu_category_id: MenuCategory.last.id) 
#       end

#   end


end
