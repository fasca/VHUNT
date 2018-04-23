class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#SECURITE page blanche, empecher l'acces de toutes les pages
#renvoie a la page de connexion si on n'est pas co
  before_action :authenticate_user!
end
