module Responders
  class Quitgame < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      match_message("Quit")
    end
    
    def handle
    	Player.destroy_all(game_id: user.game_id)
    	Game.destroy_all(id: user.game_id)
    	user.destroy!
      text_response("See you again :)")
    end
    
  end
end
