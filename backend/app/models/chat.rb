# class Chat < ApplicationRecord
#   belongs_to :doctor
#   belongs_to :patient
# end

################# for the migration##################

# class CreateChats < ActiveRecord::Migration[5.2]
#   def change
#     create_table :chats do |t|
#       t.text :message
#       t.references :doctor, foreign_key: true
#       t.references :patient, foreign_key: true
#
#       t.timestamps
#     end
#   end
# end
