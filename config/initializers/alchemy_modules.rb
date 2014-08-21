# my_host_app/config/initializers/alchemy_modules.rb
Alchemy::Modules.register_module({
  name: 'admin',
  order: 1,                             # The position in main navigation, if you have more than 1 module.
  navigation: {
    name: 'manage_restaurants',           # The name in the main navigation (translated via I18n).
    controller: '/admin/restaurants',      # The controller that will be used.
    action: 'index',                    # The controller action that will be used.
    icon: 'module_icon',                # Class of icon that will be rendered as navigation icon.
    sub_navigation: [
      {
        name: 'Restaurants',       # The name for the subnavigation tab (translated via I18n).
        controller: '/admin/restaurants',  # Controller that will be used.
        action: 'index'                 # Controller action that will be used.
      },

      {
        name: 'Menus',       # The name for the subnavigation tab (translated via I18n).
        controller: '/admin/menus',  # Controller that will be used.
        action: 'index'                 # Controller action that will be used.
      },
            {
        name: 'Menu Categories',       # The name for the subnavigation tab (translated via I18n).
        controller: '/admin/menu_categories',  # Controller that will be used.
        action: 'index'                 # Controller action that will be used.
      },
            {
        name: 'Menu Items',       # The name for the subnavigation tab (translated via I18n).
        controller: '/admin/menu_items',  # Controller that will be used.
        action: 'index'                 # Controller action that will be used.
      },
              {
        name: 'Newsletter',       # The name for the subnavigation tab (translated via I18n).
        controller: '/admin/newsletters',  # Controller that will be used.
        action: 'index'                 # Controller action that will be used.
      }
    ]
  }
})