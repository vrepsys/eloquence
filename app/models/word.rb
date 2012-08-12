class Word < ActiveRecord::Base
  attr_accessible :definition, :wordstring, :words_list_id
  belongs_to :words_list
end
