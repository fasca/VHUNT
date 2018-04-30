class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#SECURITE page blanche, empecher l'acces de toutes les pages
#et renvoie a la page de connexion si on n'est pas co
  before_action :authenticate_user!

#pour Devise, ajout d'avatar pour l'user. comme on n'a pas acces
#aux controlers de Devise (car dans la gem) alors ils heriterons du before_action
#et de la methode configure_permitted_parameters
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
  	#pour le test on a configuré que l'update et pas le sign up d'où sa mise en commentaire...
    #devise_parameter_sanitizer.permit(:sign_up,        keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
