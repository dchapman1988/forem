module Forem
  class Ban < ActiveRecord::Base
    has_one :user, :class_name => Forem.user_class.to_s, :foreign_key => :user_id
  end
end
