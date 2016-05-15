module Responders
  class Startgame < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      (message['body'].downcase.include? "start") || (message['body'].downcase.include? "resume") || ( (Game.find(user.game_id).started) && !(message['body'].downcase.include? "start") &&  !(message['body'].downcase.include? "resume") )
    end
    
    def handle

      randPlayer = Player.where(game_id: user.game_id).sample
      lastPlayer = randPlayer.id
      randPlayer = randPlayer.player_name
      m = message['body'].downcase
      g = Game.find(user.game_id)
      g.addingplayers = false
      g.started = true
      g.save!
      category = Game.find(user.game_id).category

      if match_message("End game") || match_message("Scores")
        
        winners = Array.new
        pt = Player.where(game_id: user.game_id).sort_by(&:points).reverse
        
        pt.each do |player|
          winners.push("#{player.player_name}:  #{player.points} pts")
        end

        results = winners.join("\n")
        if match_message("End game")
          g.started = false
          g.save!
          [
            text_response("--={Scores}=--\n ---Round #{g.rounds}---\n #{results}"),
            text_response("Are you sure you wanna quite?\n(this will erase all scores and players)", ["Resume", "Quit"])
          ]
          else
            text_response("--={Scores}=-- \n ---Round #{g.rounds}---\n#{results}", ["Resume", "End game"])
          end


        elsif match_message("Challenge accepted") || match_message("Answer")
          lp = Player.find(g.lastplayer.to_i)
          lp.points += g.lastpoint
          lp.save!
          text_response("#{lp.player_name} \npoints:  #{lp.points}", ["Next","scores", "End game"])

          elsif match_message("Skip")
            text_response(":o Hooooo!! Bummer", ["Next","scores", "End game"])

            elsif match_message("Truth")
              require 'roo'
              record = Roo::Spreadsheet.open('./Truths.xlsx')
              truth = record.sheet(category).column(1).sample
              points = rand(1..5)
              g.lastpoint = points
              g.rounds += 1
              g.save!        
              text_response("#{truth} \n(#{points} pts)", ["Answer", "Skip"])

              elsif match_message("Dare")
                require 'roo'
                record = Roo::Spreadsheet.open('./Dares.xlsx')
                dare = record.sheet(category).column(1).sample
                points = rand(1..5)
                g.lastpoint = points
                g.rounds += 1
                g.save!      
                text_response("#{dare} \n(#{points} pts)", ["Challenge accepted", "Skip"])

                elsif g.rounds < 1
                  g.rounds += 1
                  g.lastplayer = lastPlayer
                  g.save!
                  [
                    text_response("Game started! round #{g.rounds}"),
                    text_response("I choose #{randPlayer} :P",["Truth", "Dare", "Skip"])
                  ]

                  else
                    g.rounds += 1
                    g.lastplayer = lastPlayer
                    g.save!
                    text_response("I choose #{randPlayer} :P",["Truth", "Dare", "Skip"])
                  end


    end
    
  end
end
