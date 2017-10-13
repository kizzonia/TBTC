class AddQuestionToKbs < ActiveRecord::Migration[5.0]
  def change
    add_column :kbs, :question, :text
  end
end
