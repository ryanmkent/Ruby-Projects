class CreateRpgs < ActiveRecord::Migration
  def change
    create_table :rpgs do |t|

      t.timestamps null: false
    end
  end
end
