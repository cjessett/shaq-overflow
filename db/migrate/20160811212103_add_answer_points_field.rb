class AddAnswerPointsField < ActiveRecord::Migration
  def change
    add_column :answers, :points, :integer
    add_column :questions, :points, :integer
  end
end
