class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.belongs_to :schools, index: true
      t.column "name", :string, :limit => 50
      t.column "address", :string, :limit => 50

      t.timestamps
    end
  end
end
