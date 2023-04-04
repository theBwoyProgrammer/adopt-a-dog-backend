class AvailablePuppiesController < ApplicationController
    # index and show methods for showcasing my available pups

    def create
        available_puppy = AvailablePuppy.new(available_puppy_params)
    
        if available_puppy.save
          render json: available_puppy, status: :created
        else
          render json: available_puppy.errors, status: :unprocessable_entity
        end
      end

      def update
        available_puppy = AvailablePuppy.find(params[:id])
    
        if available_puppy.update(available_puppy_params)
          render json: available_puppy
        else
          render json: available_puppy.errors, status: :unprocessable_entity
        end
      end

      def destroy
        available_puppy = AvailablePuppy.find(params[:id])
        available_puppy.destroy
    
        head :no_content
      end

    def index
        available_puppies = AvailablePuppy.all
        render json: available_puppies
    end

    def show
        available_puppy = AvailablePuppy.find(params[:id])
        render json: available_puppy
    end

    private
    
      def available_puppy_params
        params.require(:available_puppy).permit(:name, :date_of_birth, :picture, :weight, :description, :gender, :father, :mother, :wolf_percentage, :availability)
      end
    
end
