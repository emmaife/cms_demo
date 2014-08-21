class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :menu_categories, :dependent => :destroy
  has_many :menu_items, through: :menu_categories, :dependent => :destroy
  before_save :delete_essence_menu_if_trashed

  def name_with_restaurant
    "#{name} - #{self.restaurant.name}" 
  end



  # def delete_self
  #    essence =  Alchemy::EssenceMenu2.find_by(menu_id: self.id)
  #     if !essence.nil?
  #       @menu.destroy
  #     end
  #   end

  def delete_essence_menu_if_trashed
    #deletes  essence menu if the element containing the essence has been trashed in the cms
      Alchemy::EssenceMenu2.all.each do |e|
        if e.element.trashed? == true
          e.destroy
        end
      end
        Alchemy::EssenceMenu.all.each do |e|
        if e.element.trashed? == true
          e.destroy
        end
      end
    end

  # def find_essence_menu
  #     Alchemy::EssenceMenu2.find_by(menu_id: self.id)
  #  end

  #     if !essence.nil? && essence.content.element.trashed?
  #       essence.destroy
  #     end
  #   end

    # def delete_menu_if_trashed
    #   essence =  Alchemy::EssenceMenu2.find_by(menu_id: self.id)
    #     if essence.content.element.trashed? && !essence.nil? 
    #     essence.destroy
    #   if essence.nil?
    #     self.destroy
    #   end
    #   if essence.content.element.trashed? && !@self.nil? 
    #     self.destroy
    # end
end
