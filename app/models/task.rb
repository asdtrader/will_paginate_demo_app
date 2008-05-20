class Task < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  validates_presence_of :name
end
