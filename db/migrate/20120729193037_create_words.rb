class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :wordstring
      t.text :definition

      t.timestamps
    end
  end
end
