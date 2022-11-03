class CreatePlanes < ActiveRecord::Migration[6.1]
  def change
    create_table :planes do |t|
      t.string :icao24
      t.boolean :visible

      t.timestamps
    end
  end
end
