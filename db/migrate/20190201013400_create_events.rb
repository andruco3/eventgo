class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.string :organizer
      t.string :description
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
