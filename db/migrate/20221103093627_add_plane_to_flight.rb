class AddPlaneToFlight < ActiveRecord::Migration[6.1]
  def change
    add_reference :flights, :plane, null: false, foreign_key: true
  end
end
