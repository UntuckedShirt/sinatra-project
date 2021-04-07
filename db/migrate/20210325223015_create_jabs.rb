class CreateJabs < ActiveRecord::Migration[6.1]
  def change
    create_table :jabs do |t|
    t.string :title
    t.string :content
    t.string :subject
    t.belongs_to :user
    t.datetime :created_at
    t.datetime :updated_at
  end
  end
end
