class Game
    include HTTParty
	base_uri 'https://www.freetogame.com/api/games'
	
    def self.all
		get('/')
	end
	
	def self.search(title)
		all_games=all
		parsed_games=JSON.parse(all_games.body)
		filtered_title=parsed_games.select{
			|game| game['title'].downcase.include?(title.downcase)
		} 
		return filtered_title
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