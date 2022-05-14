class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower
      t.references :following
      t.index [:follower_id, :following_id], unique: true
      t.timestamps
    end
  end
end
