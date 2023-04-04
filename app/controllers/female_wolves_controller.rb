class FemaleWolvesController < ApplicationController
    # index and show methods to showcase my females

    def index
        female_wolves = FemaleWolf.all
        render json: female_wolves
    end

    def show
        female_wolf = FemaleWolf.find(params[:id])
        render json: female_wolf
    end

    def create
        female_wolf = FemaleWolf.new(female_wolf_params)
    
        if female_wolf.save
          render json: female_wolf, status: :created
        else
          render json: { errors: female_wolf.errors.full_messages }, status: :unprocessable_entity
        end
    end

    
    def update
        female_wolf = FemaleWolf.find(params[:id])

        if female_wolf.update(female_wolf_params)
        render json: female_wolf
        else
        render json: { errors: female_wolf.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        female_wolf = FemaleWolf.find(params[:id])
        female_wolf.destroy
    
        head :no_content
      end
    
      private
    
      def female_wolf_params
        params.require(:female_wolf).permit(:name, :date_of_birth, :picture, :weight, :description, :wolf_percentage)
      end
end
