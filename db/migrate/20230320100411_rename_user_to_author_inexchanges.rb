class RenameUserToAuthorInexchanges < ActiveRecord::Migration[6.1]
  def change
    rename_column :exchanges, :user_id, :author_id
  end
end
