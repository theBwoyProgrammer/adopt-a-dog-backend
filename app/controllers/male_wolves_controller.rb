class MaleWolvesController < ApplicationController
    # index and show methods to showcase my females

    def index
        male_wolves = MaleWolf.all
        render json: male_wolves
    end

    def show
        male_wolf = MaleWolf.find(params[:id])
        render json: male_wolf
    end
end
