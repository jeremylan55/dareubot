module Responders
  class Setupgame < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      Game.find(user.game_id).category.nil?
    end

    def handle
      if match_message('Kids') || match_message('Teens') || match_message('College') || match_message('Family')
        g = Game.find(user.game_id)
        g.category = message['body']
        g.save!
        text_response("Enter first player's name")
      else
        text_response("#{Game.last.id}, #{user.game_id} Choose type of game",["Kids", "Teens", "College", "Family"])
      end

    end
    
  end
end
