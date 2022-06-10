class AddAuthenticationTokenToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :authentication_token, :string, limit: 30
    add_index :companies, :authentication_token, unique: true
  end
end
