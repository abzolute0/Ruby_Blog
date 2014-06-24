class CreateArtilces < ActiveRecord::Migration
  def change
    create_table :artilces do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
