class AddTokenToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :token, :string
    add_index :members, :token, unique: true

    Member.all.each do |member|
      member.regenerate_token
    end
  end
end
