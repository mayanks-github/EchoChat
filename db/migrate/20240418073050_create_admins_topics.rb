class CreateAdminsTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :admins_topics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
