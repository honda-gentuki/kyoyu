class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :subject,            null: false
      t.string     :course,             null: false
      t.string     :unit,               null: false
      t.string     :introduction
      t.integer    :introduction_time
      t.text       :development
      t.integer    :development_time
      t.string     :summary
      t.integer    :summary_time
      t.string     :teaching_materials, null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end 
end
