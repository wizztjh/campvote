require 'twitter'
class BarcampSession < ActiveRecord::Base
    has_many :voters
	validates :hash_tag , :format => {:with => /^#\w+$/ } , :presence => true ,:uniqueness => true
	validates :name , :presence => true 
	validates :email , :presence => true , :format => {:with => /((\S+)@(\S{3}[a-zA-z0-9)]\S*))/ }
	validates :handphone, :presence => true 
	

	
	def self.update_twitter!
		BarcampSession.all.each do |sess|
		    search = Twitter::Search.new
            positive_search = search.hashtag("barcampmlk2").hashtag(sess.hash_tag).containing("+1").per_page(100).no_retweets
            tweets = positive_search.fetch
            positive_search.clear
			
			tweets.each do |tweet|
				Voter.find_or_create_by_name_and_barcamp_session_id( tweet.from_user , sess.id)
			end
		    
		end
	end
	
	
	
end
