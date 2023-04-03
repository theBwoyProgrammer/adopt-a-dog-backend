class MaleWolf < ApplicationRecord
    # add associations has many available puppies
    has_many :available_puppies

    # add apropriate validations
    validates :name, :date_of_birth, :picture, :weight, :description, presence: true
    validates :wolf_percentage, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    
end
