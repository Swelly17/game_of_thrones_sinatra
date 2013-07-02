class AddHouseIdToPeoplesTable < ActiveRecord::Migration
  def up
    #Add column to :people, :houes_id, :integer...
    change_table :people do |t|
      t.references :house
    end
  end

  def down
    remove _column :house_id
  end
end
