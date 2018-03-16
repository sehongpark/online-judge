class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :text
      t.string :lang
      t.string :status
      t.string :output

      t.timestamps
    end
  end
end
