class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
        t.references :user, foreign_key: true
        t.string :content, null:false
        t.integer :status, null:false
        t.timestamps # created_atとupdated_atが自動定義される、便利！
    end
  end
end
