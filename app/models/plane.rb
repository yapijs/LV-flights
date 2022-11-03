class Plane < ApplicationRecord
  has_many :flights, :dependent => :destroy
end
