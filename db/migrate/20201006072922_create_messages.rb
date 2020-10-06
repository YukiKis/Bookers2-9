class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :follower
      t.references :followed
      t.text :message

      t.timestamps
    end
  end
end
