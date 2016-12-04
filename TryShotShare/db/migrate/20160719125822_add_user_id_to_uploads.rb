class AddUserIdToUploads < ActiveRecord::Migration[5.0]
  def self.up
  	change_table :uploads do |t|
  		t.references :user, foreign_key: true
  	end
  end

  def self.down
  	remove_references :uploads, :user
  end
end
