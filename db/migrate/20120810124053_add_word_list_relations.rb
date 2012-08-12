class AddWordListRelations < ActiveRecord::Migration
  def change
    change_table :words do |t|
      t.references :words_list
    end
    #Word.all.each do |w|
    #  w.update_attribute('words_list_id', 1)
    #end
  end
end
