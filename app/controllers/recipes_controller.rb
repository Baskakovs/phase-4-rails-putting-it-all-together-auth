class RecipesController < ApplicationController
    before_action :authenticate, only: [:create, :index]

    def index
        recipes = Recipe.all
        render json: recipes, include: :user, status: :ok
    end

def create
    recipe = Recipe.create(user_id: session[:user_id], title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete])
    if recipe.valid?
        render json: recipe, include: [:user], status: :created
    else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
end

    private

    def authenticate
        render json: { errors: ["You must be logged in to do that"] }, status: :unauthorized unless session.include? :user_id
    end
end
