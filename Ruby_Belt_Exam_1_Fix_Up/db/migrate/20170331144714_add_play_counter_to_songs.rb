class AddPlayCounterToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :play_counter, :integer
  end
end
