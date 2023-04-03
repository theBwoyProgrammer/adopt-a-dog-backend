class AvailablePuppiesController < ApplicationController
    # index and show methods for showcasing my available pups

    def index
        available_puppies = AvailablePuppy.all
        render json: available_puppies
    end

    def show
        available_puppy = AvailablePuppy.find(params[:id])
        render json: available_puppy
    end
    
end
