class Game
    include HTTParty
	base_uri 'https://www.freetogame.com/api/games'
	
    def self.all
		get('/')
	end
	def self.search(platform)
		get("?platform=#{platform}")
	end
	def self.find(id)
		games=get('/')
		for game in games
			if game['id']==id.to_i
			  return game
			end
		end 
		nil
	end
end