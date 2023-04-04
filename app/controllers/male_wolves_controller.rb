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

    def create
        male_wolf = MaleWolf.new(male_wolf_params)
    
        if male_wolf.save
          render json: male_wolf, status: :created
        else
          render json: { errors: male_wolf.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        male_wolf = MaleWolf.find(params[:id])
    
        if male_wolf.update(male_wolf_params)
          render json: male_wolf
        else
          render json: { errors: male_wolf.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        male_wolf = MaleWolf.find(params[:id])
        male_wolf.destroy
    
        head :no_content
    end
    
      private
    
    def male_wolf_params
        params.require(:male_wolf).permit(:name, :date_of_birth, :picture, :weight, :description, :wolf_percentage)
    end
end
