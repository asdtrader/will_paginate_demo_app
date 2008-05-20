class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.timestamps
    end
    say_with_time "Adding tasks" do    
      500.times do |number|
        Task.create(:name => "Task ##{number}")
      end
    end
  end

  def self.down
    drop_table :tasks
  end
end
