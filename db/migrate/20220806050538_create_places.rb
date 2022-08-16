class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.references  :end_user,  index: true, foreign_key: true
      t.references  :group, index: true, foreign_key: true
      t.string :place_name, null: false, default:""
      t.string :address, null: false, default:""
      t.text :introduction, null:false, default:""
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :image_id
      t.integer :number, default: 0
      t.timestamps
    end
  end
end