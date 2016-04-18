class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :attachments
  end
end
