class MenusController < ApplicationController
  before_action :set_menu, only: [:show]
def new
@menu = Menu.new
end



  # def create
  #   @menu = Menu.create(menu_params)
  #   respond_to do |format|
  #     if @menu.save
  #       format.html { redirect_to "/admin", notice: 'Menu was successfully created.' }
  #     else
  #       format.html { render action: 'new' }
  #     end
  #   end
  # end  
  
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
     params.require(:menu).permit(:name, :restaurant_id, :id, :post_to_fb, :fb_post_text, :post_to_twitter, :tweet)
  end

end
