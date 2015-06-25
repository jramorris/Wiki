class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true

	def self.recently_updated 
		order("updated_at desc").limit(5)
	end

end
