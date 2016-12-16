class AddUserIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :author, :string
  end

end
