module Responders
  class Introduction < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      (user.introduced.nil? || (user.game_id.nil? && !(match_message("Yes!"))) ) && !match_message("Nah")
    end
    
    def handle
      user.game = Game.create(rounds: 0, started: false, addingplayers: true, category: nil, lastplayer: nil, lastpoint: 0)
      user.introduced = true
      user.save!
      text_response("Hello my name is DareUBot, Let's play Truth or Dare!", ["Yes!", "Nah"]) 
    end
    
  end
end
