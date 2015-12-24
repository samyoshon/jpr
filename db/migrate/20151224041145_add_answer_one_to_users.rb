class AddAnswerOneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answer_one, :text
  end
end
