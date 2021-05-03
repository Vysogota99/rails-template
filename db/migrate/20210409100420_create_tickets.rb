class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      enable_extension 'pgcrypto'

      t.integer :category
      t.integer :status, default: 1
      t.integer :event_id
      t.integer :owner_id
      t.string  :uuid
      t.integer :base_price

      t.timestamps

      t.index [:uuid, :owner_id]
    end
  end
end
