class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :status, :default => "approved", :null => "false"
      t.timestamps
    end
    say_with_time "Adding pages" do
      500.times do |number|
        Page.create(:name => "Page ##{number}", :status => number.even? ? "approved" : "pending")
      end
    end
  end

  def self.down
    drop_table :pages
  end
end
