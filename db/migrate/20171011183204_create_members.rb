class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :key
      t.date :start_date
      t.date :end_date
      t.string :first_name
      t.string :last_name
      t.integer :clothes_balance
      t.integer :active
      t.string :status
      t.string :member_type
      t.string :referred_by
      t.decimal :boost_credit
      t.boolean :birthday_boost
      t.decimal :cost
      t.string :email
      t.string :add_on
      t.boolean :flagged_member
      t.string :password
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.timestamps
    end
  end
end
