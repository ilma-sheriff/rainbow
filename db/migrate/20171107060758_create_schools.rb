class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.column "name", :string, :limit => 50
      t.column "address", :string, :limit => 50

      t.timestamps
    end
  end
end
