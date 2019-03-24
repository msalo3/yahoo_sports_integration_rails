class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.belongs_to :user
      t.string :access_token
      t.string :refresh_token
      t.string :time_remaining

      t.timestamps
    end
  end
end
