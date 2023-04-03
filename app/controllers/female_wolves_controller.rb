class FemaleWolvesController < ApplicationController
    # index and show methods to showcase my females

    def index
        female_wolves = FemaleWolves.all
        render json: female_wolves
    end

    def show
        female_wolf = FemaleWolf.find(params[:id])
        render json: female_wolf
    end
end
