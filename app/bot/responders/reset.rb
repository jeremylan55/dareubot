module Responders
  class Reset < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      match_message 'Reset'
    end
    
    def handle
      user.destroy!
      text_response("Deleted everything")
    end
    
  end
end
