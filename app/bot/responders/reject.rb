module Responders
  class Reject < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      match_message("Nah")
    end
    
    def handle
    	Game.find(user.game_id).destroy
      text_response("Why not?")
    end
    
  end
end
