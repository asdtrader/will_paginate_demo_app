class CreateAdminSecrets < ActiveRecord::Migration
  def self.up
    create_table :admin_secrets, :force => true do |t|
      t.string :name

      t.timestamps
    end
    say_with_time "Adding secrets" do
      500.times do |number|
        Admin::Secret.create(:name => "Admin Secret ##{number}")
      end
    end
  end

  def self.down
    drop_table :admin_secrets
  end
end
