class CreateAddAuthenticityTokenToEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :add_authenticity_token_to_emails do |t|
      add_column :emails, :authenticity_token, :string

      t.timestamps
    end
  end
end
