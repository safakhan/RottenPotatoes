class MoviesController < ApplicationController
	def index 
		@movies = Movie.order(params[:sort_by]) 
		# @movies = Movie.all.sort_by { |m| m.title.capitalize } if params[:sort_by].eql?("title")

		# params[:sort_by].eql?("title")  ? 
		# require 'pry'
		# binding.pry
	end

	def show
	  id = params[:id] # retrieve movie ID from URI route
	  @movie = Movie.find(id) # look up movie by unique ID
	  # @movie = Movie.all.sort_by { |m| m.title }
	  # will render app/views/movies/show.html.haml by default
	end

	def new
	#default: render 'new' template
	params[:sort_by]

	end

	# in movies_controller.rb
	def create
	  # binding.pry
	  @movie = Movie.create!(params[:movie])
	  flash[:notice] = "#{@movie.title}  was successfully created."
	  redirect_to movies_path
	end

	# in movies_controller.rb

	def edit
	  @movie = Movie.find params[:id]
	end

	def update
	  @movie = Movie.find params[:id]
	  @movie.update_attributes!(params[:movie])
	  flash[:notice] = "#{@movie.title} was successfully updated."
	  redirect_to movie_path(@movie)
	end

	def destroy
	  @movie = Movie.find(params[:id])
	  @movie.destroy
	  flash[:notice] = "Movie '#{@movie.title}' deleted."
	  redirect_to movies_path
	end
end