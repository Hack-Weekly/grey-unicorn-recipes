class ChangeMemberToUserInAuthorizations < ActiveRecord::Migration[7.0]
  def change
    rename_column :authorizations, :member_id, :user_id
  end
end
