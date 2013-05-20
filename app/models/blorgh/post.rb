module Blorgh
  class Post < ActiveRecord::Base
    attr_accessor :author_name
    belongs_to :author, :class_name => "User"
    has_many :comments

    attr_accessible :text, :title, :author_name

    before_save :set_author
     
    private
      def set_author
        self.author = User.find_or_create_by_name(author_name)
      end
  end
end
