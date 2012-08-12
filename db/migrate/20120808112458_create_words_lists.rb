class CreateWordsLists < ActiveRecord::Migration
  def change
    create_table :words_lists do |t|
      t.string :name

      t.references :user

      t.timestamps
    end
  end
end
