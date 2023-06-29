class CreateAuthorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :authorizations do |t|
      t.integer :member_id
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.string :username
      t.timestamps
    end
  end
end
