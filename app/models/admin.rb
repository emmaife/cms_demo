module Admin

  class RestaurantsController < Alchemy::Admin::ResourcesController

    def new
      @restaurant = Restaurant.new
    end
  
  end



  class MenusController < Alchemy::Admin::ResourcesController
            # before_action :set_menu, only: [:show, :edit, :update, :destroy]

    def new
      @menu = Menu.new
      @restaurants = Restaurant.all
      @menus = Alchemy::EssenceMenu.all

    end
    def edit
      @restaurants = Restaurant.all
    end

  end

  class MenuItemsController < Alchemy::Admin::ResourcesController
    def new
      @menu_item = MenuItem.new
      @menu_categories = MenuCategory.all
    end
    def edit
      @menu_categories = MenuCategory.all
    end
  end

    class MenuCategoriesController < Alchemy::Admin::ResourcesController

      def new
        @menu_category = MenuCategory.new
        @menus = Menu.all
      end

      def edit
        @menus = Menu.all
      end
  end


end