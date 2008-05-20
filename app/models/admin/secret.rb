class Admin::Secret < ActiveRecord::Base
  validates_presence_of :name
  set_table_name :admin_secrets

  def self.per_page
    15
  end
end
