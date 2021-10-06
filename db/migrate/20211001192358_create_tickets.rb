class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :description
      t.integer :status, null: false, default: 0
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
