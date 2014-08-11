# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Organization.create(name: 'Food Inc.')
BusinessGroup.create(name: 'Brother Jimmies', organization_id: 1)
Region.create(name: 'Northeast U.S.', business_group_id: 1)
Region.create(name: 'Midwest', business_group_id: 1)

Location.create(region_id: 1, address: "321 8th Ave", city: "New York", state: "New York", business_group_id: 1, business_id: 1, business_type: 'Restaurant')
Location.create(region_id: 1, address: "Madison Square Garden", city: "New York", state: "New York", business_group_id: 1, business_id: 2, business_type: 'Restaurant')

Restaurant.create(name: 'Brother Jimmies 8th Ave.')
Restaurant.create(name: 'Brother Jimmies MSG')

Menu.create(name: "Breakfast")
Menu.create(name: "Lunch")
Menu.create(name: "Dinner")

MenuCategory.create(name: "Starters")
MenuCategory.create(name: "Main")
MenuCategory.create(name: "Dessert")

RestaurantMenu.create(restaurant_id: 1, menu_id: 1)
RestaurantMenu.create(restaurant_id: 1, menu_id: 2)
RestaurantMenu.create(restaurant_id: 2, menu_id: 1)

RestaurantMenuCategory.create(restaurant_menu_id: 1, menu_category_id: 1)
RestaurantMenuCategory.create(restaurant_menu_id: 2, menu_category_id: 2)
RestaurantMenuCategory.create(restaurant_menu_id: 1, menu_category_id: 3)

RestaurantMenuItem.create(restaurant_menu_category_id: 1, name: "Eggs")
RestaurantMenuItem.create(restaurant_menu_category_id: 1, name: "Pancakes")
RestaurantMenuItem.create(restaurant_menu_category_id: 2, name: "Burger")





