class AddPublicIdToUpload < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :public_id, :string
  end
end
