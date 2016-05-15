module Responders
  class Default < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"
    
    def can_handle?
      true
    end
    
    def handle
      text_response("I did not understood that")
    end
    
  end
end
