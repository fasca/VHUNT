class ProductsController < ApplicationController
	#Avant d'appeler certaines actions, appel d'abord la methode
	#find_product. before_action permet re refactoriser le code
	#car on récupere souvent la valeur dans la bdd "@product = Product.find(params[:id])"
	before_action :find_product, only: [:show, :edit, :update, :destroy]


	#CONST
	#tab office de bdd avant presentation d'active records
	#PRODUCTS = [
	#				{name: "basket-ball", category: "en equipe"},
	#				{name: "surf", category: "mer"},
	#				{name: "snowboard", category: "montagne"},
	#				{name: "ski", category: "montagne"},
	#				{name: "tir à l'arc", category: "tir"}
	#]

	def index
		#Recuperer les données de la BDD
		#@products = Product.all

		#@date = Date.today

		#afficer txt, jointure du tableau :
		#@products = ["alpha", "beta", "delta"]
		#render plain: products.join("; ")
		
		#@products contient tt le tat CONST :
		#@products = PRODUCTS

		#Exemple de Query String, passer une var depuis l'url "?filter=paris"
		#Si dans ma requete j'ai ajouté un <PARAMS> ":filter", alors dans mon tab CONST PRODUCTS
		#je selectionne ceux qui dont la "category" correspond au param de l'url
		#sinon je prends tt le tab
		# Exemple d'url: "http://localhost:3000/products?filter=montagne"
		#if params[:filter]
		#	@products = PRODUCTS.select {|product| product[:category] == params[:filter]}
		#else
		#	@products = PRODUCTS
		#end

		#Si dans l'url on a une category alors on récuperer les produits de cette categorie
		#sinon on récupere tout
		#ici le "where" fait partie d'une methode Active Record
		if params[:category]
			@products = Product.where(category: params[:category])
		else
			@products = Product.all
		end
	end

	def show
		#on recupere une valeur du tab CONST PRODUCTS via un index
		#@product = PRODUCTS[params[:id].to_i]

		#en recupere une valeur de la bdd via son ID
		#PLUS BESOIN CAR LE CODE EST APPELE VIA BEFORE_ACTION PLUS HAUT
		#@product = Product.find(params[:id]) 
	end

	def new
		#pour generer un formulaire avec form_for
		@product = Product.new
	end

	def create
		#point d'arret ici, pour debug dans le terminal
		#binding.pry

		#au lieu de recuperer les variables params[:product] on utilise 
		#les strong params permettant de filtrer les params
		#en gros c'est une fonction qui filtre
		@product = Product.new(product_params)
		#si il a respecté les champs obligatoires on save et on redirige sur la page des produits
		if @product.save 
			redirect_to products_path
		else
			#sinon renvoie le template "new" avec ce que l'user a écrit
			#vu que l'attribut @product a été déja instancié alors les données sont toujours présentes
			render :new
		end
	end

	def edit
		#si on regarde le code html dans le navigateur on remarque
		#que ACTION respecte les routes soit /products/:id pour update
		#car edit envoie vers update.
		#ici on recupere les données de la bdd grace à l'id dans params
		#PLUS BESOIN CAR LE CODE EST APPELE VIA BEFORE_ACTION PLUS HAUT
		#@product = Product.find(params[:id])
	end

	def update
		#PLUS BESOIN CAR LE CODE EST APPELE VIA BEFORE_ACTION PLUS HAUT
		#@product = Product.find(params[:id])
		#comme pour le combo new create, on update avec le strong param comme filtre
		#sinon en renvoie la page d'edit avec les données fraichement inséré
		if @product.update(product_params)
			redirect_to products_path
		else
			render :edit
		end
	end

	def destroy
		#PLUS BESOIN CAR LE CODE EST APPELE VIA BEFORE_ACTION PLUS HAUT
		#@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	private
  	def product_params
  		#require permet de garder que ce que contient product puis on filtre avec permit
    	params.require(:product).permit(:name, :url, :tagline, :category)
  	end

  	def find_product
  		@product = Product.find(params[:id])
  	end

end
