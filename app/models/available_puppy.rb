class AvailablePuppy < ApplicationRecord
    # add associations
    belongs_to :father, class_name: "AvailablePuppy", optional: true
    belongs_to :mother, class_name: "AvailablePuppy", optional: true
   
    # add apropriate validations
    validates :name, :date_of_birth, :picture, :weight, :description, :gender, :father, :mother, presence: true
    validates :wolf_percentage, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :availability, inclusion: { in: [true, false] }




end
