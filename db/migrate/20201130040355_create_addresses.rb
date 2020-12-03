class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal       ,null:false
      t.integer    :area_id,null:false
      t.string     :home         ,null:false
      t.string     :home_number  ,null:false
      t.string     :building
      t.string     :number       ,null:false
      t.references :customer     ,foreign_key: true
      t.timestamps
    end
  end
end
