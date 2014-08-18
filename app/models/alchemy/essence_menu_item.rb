class Alchemy::EssenceMenuItem < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :menu_category
  acts_as_essence(ingredient_column: 'menu_item_id'
    # Your options:
    #
    # ingredient_column:   [String or Symbol] - Specifies the column name you use for storing the content in the database. (Default :body)
    # validate_column:     [String or Symbol] - Which column should be validated. (Default: ingredient_column)
    # preview_text_column: [String or Symbol] - Specifies the column for the preview_text method. (Default: ingredient_column)
    # preview_text_method: [String or Symbol] - A method called on ingredient to get the preview text. (Default: ingredient_column)
  )

attr_accessor :category_and_item_updated
after_update :create_category_and_item, unless: :category_and_item_updated
after_find :delete_if_trashed

  def create_category_and_item
    # @menu_category = MenuCategory.where(name: content.element.contents.first.essence.body, menu_id: self.page.find_elements({:only => ["restaurant_and_menu"]}).first.essences.first.menu_id).first_or_create
    # @menu_item = MenuItem.where(name: self.name, price: self.price, menu_category_id: @menu_category.id).first_or_create
    # self.category_and_item_updated= true
    # self.update(menu_item_id: @menu_item.id)
    @menu_category = MenuCategory.find_by(id: self.menu_category_id)
    if @menu_category.nil?
      @menu_category = MenuCategory.where(name: content.element.contents.first.essence.body, menu_id: self.page.find_elements({:only => ["restaurant_and_menu"]}).first.essences.first.menu_id).first_or_create
    end

    @menu_item = MenuItem.find_by(id: self.menu_item_id)
    if @menu_item.nil?
      @menu_item = MenuItem.create(name: self.name, price: self.price, menu_category_id: @menu_category.id)
      @menu_category.update(name: content.element.contents.first.essence.body, menu_id: self.page.find_elements({:only => ["restaurant_and_menu"]}).first.essences.first.menu_id)
    else
      @menu_item.update(name: self.name, price: self.price, menu_category_id: @menu_category.id)
      @menu_category.update(name: content.element.contents.first.essence.body, menu_id: self.page.find_elements({:only => ["restaurant_and_menu"]}).first.essences.first.menu_id)
    end
    self.category_and_item_updated= true
    self.update(menu_item_id: @menu_item.id)
  end

  def delete_if_trashed
    @menu_category = MenuCategory.find_by(id: self.menu_category_id)
    # if @menu_category.nil?
    #   @menu_category = MenuCategory.where(name: content.element.contents.first.essence.body, menu_id: self.page.find_elements({:only => ["restaurant_and_menu"]}).first.essences.first.menu_id).first_or_create
    # end    
    if self.content.element.trashed? && !@menu_category.nil?
        @menu_category.destroy
    end
  end



end

# .element.essences.first

# page.find_elements({:only => ["restaurant_and_menu"]}).first.essences.menu_id
# menu_cat = self.content.element.contents.first.essence.body

# self.name
# self.price


#   def delete_if_trashed
#     @menu = Menu.find_by_id(self.menu_id)
#     if self.content.element.trashed? && !@menu.nil? 
#         @menu.destroy 
#     end
#   end