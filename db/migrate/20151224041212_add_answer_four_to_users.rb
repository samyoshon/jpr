class AddAnswerFourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answer_four, :text
  end
end
