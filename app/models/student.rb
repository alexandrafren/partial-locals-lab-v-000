# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(keyword)
    @students = []
    Student.all.each do |s|
      if keyword == ""
        @students == Student.all
      elsif s.name.downcase[keyword.to_s]
        @students << s
      end
    end
  end

end
