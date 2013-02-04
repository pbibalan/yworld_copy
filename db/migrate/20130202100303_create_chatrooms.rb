class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :collaboration_id

      t.timestamps
    end
  end
end
