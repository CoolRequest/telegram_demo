class CreateReceivedMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :received_messages do |t|
      t.bigint :chat_id
      t.text :text
      t.text :webhook_params

      t.timestamps
    end
  end
end
