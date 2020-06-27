class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
        t.string :name, null: false
        t.string :password_digest, null: false # ActiveRecordのhas_secure_passwordを使う際にpasswordではなく、password_digestにする
        t.string :email, null: false
        
        t.timestamps
        t.index :email, unique: true #一意制約をつける
    end
  end
end
