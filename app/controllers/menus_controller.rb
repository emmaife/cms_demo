class MenusController < ApplicationController
  before_action :set_menu, only: [:show]
  
def index
  # sorts menus according to the number in the order column
  @menus = Menu.all.sort {|a, b| a.order <=> b.order}
end

def show
end

private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
     params.require(:menu).permit(:name, :restaurant_id, :id)
  end

end
