class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :subject,            null: false
      t.string     :course,             null: false
      t.string     :unit,               null: false
      t.string     :introduction,       null: false
      t.integer    :introduction_time,  null: false
      t.text       :development,        null: false
      t.integer    :development_time,   null: false
      t.string     :summary,            null: false
      t.integer    :summary_time,       null: false
      t.string     :teaching_materials, null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end 
end
