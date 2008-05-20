class Page < ActiveRecord::Base
  validates_presence_of :name, :status
  named_scope :approved, :conditions => {:status => "approved"}
  named_scope :pending, :conditions => {:status => "pending"}
end
