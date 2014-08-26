
class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :menu_categories, :dependent => :destroy
  has_many :menu_items, through: :menu_categories, :dependent => :destroy
  before_save :delete_essence_menu_if_trashed
  after_save :update_facebook, :update_twitter
require 'koala'
require 'twitter'
require 'twitter-text'
include Twitter::Autolink
include Twitter::Extractor



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


    def update_facebook
      if self.post_to_fb == true
        @test_users = Koala::Facebook::TestUsers.new(:app_id => 563723927073001, :app_access_token => '563723927073001|aBIz1i3kxFNcoENds4ushYbT_nU')
        @graph = Koala::Facebook::GraphAPI.new('CAAIAtDRssOkBACzCJYqw4CjaZAZCnLxjJEE454tcdkZCIPkdC7fkmhUx4Qg7aIZAsaAa24VmjtJbMm1ZCQbk7ZAlqHiokOF3UBFxuBZCC5h0SP6oUF0iG3P1WA1l2vjNNEkeiQl7WpGWWDJVmbt60GD5AmktOnXaWgUAZCTMRMYcYO6g1w1AbYjRHVjzZAdjbZBCdsWNJzfDeWGC5co47awCBx')
        @graph.put_connections("me", "feed", :link => 'http://www.google.com', :message => self.fb_post_text)
      end 
    end

    def update_twitter
      if self.post_to_twitter == true
        client = Twitter::REST::Client.new do |config|
          config.consumer_key = "qISeOyjCdd0QYLXZ8fDT66k7J"
          config.consumer_secret = "jD52eHnM6Q9o0fcp4cz8bLnpvnkGsMnWHFen70RySKIG0wJ31c"
          config.access_token = "2767410901-DZGkpTZnPAlL0G8TuyjSf0JFRJJDlGDTPNne2Tf"
          config.access_token_secret = "7KAINuZHBFHALtjE2KJtogviUwoz7bRLzngeDwhmttHU3"
        end
        hashtags = extract_hashtags(self.tweet)
        client.update(self.tweet+ " www.google.com")
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
