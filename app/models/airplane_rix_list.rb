class AirplaneRixList < ApplicationRecord
  has_many :flights, dependent: :destroy
end
