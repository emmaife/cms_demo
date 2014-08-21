class Alchemy::EssenceMenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :restaurant
  acts_as_essence(ingredient_column: 'menu_id', #associates Alchemy Essence with Active Record Menu object
  
    # Your options:
    #
    # ingredient_column:   [String or Symbol] - Specifies the column name you use for storing the content in the database. (Default :body)
    # validate_column:     [String or Symbol] - Which column should be validated. (Default: ingredient_column)
    # preview_text_column: [String or Symbol] - Specifies the column for the preview_text method. (Default: ingredient_column)
    # preview_text_method: [String or Symbol] - A method called on ingredient to get the preview text. (Default: ingredient_column)
  )
  attr_accessor :menu_parsed
  after_update :parse_menu_text, unless: :menu_parsed
  before_destroy :delete_menu


  def parse_menu_text
    # parse_menu_text is called after essence menu is updated and creates menu, menu category, 
    # and menu items
    @menu = Menu.find_by(id: self.menu_id)
      if !@menu.nil? 
        @menu.destroy  # overwrite menu each time parse_menu_text is called on existing essencemenu/menu pair
      end
    menu_arr = self.menu_text.split(/\n/)
    menu_arr.each do |item|
        if item == menu_arr[0]
          # checks first line and sets it equal to menu title (ie dinner, lunch) 
          @menu = Menu.create(name: item, restaurant_id: content.essence.restaurant_id, order: Menu.last.nil? ? 1 : Menu.last.order + 1)
        elsif item.include?(':') # then checks for colon which indicates menu category.
          @menu_category =  MenuCategory.create(name: item.split(":").first, menu_id: @menu.id)
        elsif item.include?('-') #checks for dash which indicates menu item (before dash) and menu price (after dash)
          menu_item_and_price = item.split('-')
          @menu_items = MenuItem.create(name: menu_item_and_price[0], price: menu_item_and_price[1], menu_category_id: MenuCategory.last.id) 
        end
      end
      self.menu_parsed = true #sets menu_parsed to true so that parse_menu_text method isn't called after the self.update below
      self.update(menu_id: @menu.id) #  updates self.menu_id with the id of created menu.
  end

  def delete_menu
  # is called after essence menu is destroyed. deletes associated menu.
    @menu = Menu.find_by(self.menu_id)
      if !@menu.nil?
        @menu.destroy
      end
    end


  # def delete_menu_if_trashed
  #   @menu = Menu.find_by(self.menu_id)
  #   if self.content.element.trashed? && !@menu.nil? 
  #     @menu.destroy
  #   end
  # end

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
