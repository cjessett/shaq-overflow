class CreateFavoriteForAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :favorite, :boolean, default: :false
  end
end
