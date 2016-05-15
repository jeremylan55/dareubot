class ApplicationHandler < Bot::Handler

	use Responders::Reset
  use Responders::Introduction
  use Responders::Reject
  use Responders::Setupgame
  # use Responders::Pickcategory
  use Responders::Addplayer
  use Responders::Startgame
  use Responders::Quitgame
  use Responders::Default

  def user_for(message)
    User.find_or_create_by(username: message["from"])
  end
end