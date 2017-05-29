class AddPlayCounterToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :play_counter, :integer, :default => 0
  end
end
