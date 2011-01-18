# == Schema Information
# Schema version: 20110116234112
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  # Order microposts from newest to oldest with DESC, SQL for Descending
  default_scope :order => 'microposts.created_at DESC'
end