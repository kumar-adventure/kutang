class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :subject

  validates :email, :message, :subject, presence: true

  validates_format_of :email, with: /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  validates :message, length: {within: 10..20}

end
