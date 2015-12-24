class AddAnswerThreeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answer_three, :text
  end
end
