class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :medium, polymorphic: true
  has_many :comments ,dependent: :destroy
  has_many :likes, as: :likeable
  has_one :device_inf, dependent:  :destroy
  has_many :notifications, as: :notificable
  def comment_for_show_in_post( number_of_comments)

    comments =   self.comments.order('id desc').all[number_of_comments-4..number_of_comments]
    if comments
      comments
    else
      []
    end
  end


end
