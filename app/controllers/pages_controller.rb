class PagesController < ApplicationController
  def home
  	#Renvoyer un texte simple:
  	#render plain: "Welcome!"
  end

  def team
  	#render plain: "La Team!"
  end

  def join_us
  	#render plain: "Contact me!"
  	@members = ["Mr. A", "Mr. B", "Mr. C"]
  end

end
