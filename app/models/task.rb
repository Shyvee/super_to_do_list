class Task < ActiveRecord::Base
  validates :task_name, :presence => true

  belongs_to :category
end
