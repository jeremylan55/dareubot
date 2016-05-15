module Responders
  class Addplayer < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      Game.find(user.game_id).addingplayers && !match_message("Start game") || match_message("Add player") || match_message("Add another player")
      #user.game_id != nil && Player.where() || match_message("Add another player")
    end
    
    def handle
      # text_response('addplayer')
      if message['body'] == "Add another player"
        text_response("Enter player's name")
      elsif message['body'] == "Re-enter player's name" 
        player = Player.where(game_id: user.game_id).last.destroy
        text_response("Re-enter player's name")
      elsif Player.where(game_id: user.game_id).where(player_name: message['body']).count > 0
        name = message['body']
        [
          text_response("'#{name}' is already taken!"),
          text_response("Choose another nickname")
        ]
      
      else 
        newPlayer = message['body']
        player = Player.create(game_id: user.game_id, player_name: newPlayer, points: 0)
        player.save!
        [
        text_response("'#{newPlayer}' has been added to the game!"),
        text_response("Do you want to add another player?", ["Add another player", "Start game", "Re-enter player's name"]) 
        ]
      end

    end
    
  end
end
