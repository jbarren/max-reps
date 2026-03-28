class CreateSeries < ActiveRecord::Migration[8.1]
  def change
    create_table :series do |t|
      t.integer :reps
      t.string :mark

      t.timestamps
    end
  end
end
