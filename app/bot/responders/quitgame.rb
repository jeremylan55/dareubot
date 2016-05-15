module Responders
  class Quitgame < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      match_message("Quit")
    end
    
    def handle
      Game.find(user.game_id).destroy
    	Player.destroy_all(game_id: user.game_id)
    	user.destroy!
      text_response("See you again :)")
    end
    
  end
end
