class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # # for serializer
  # attr_reader :town
  # alias :read_attribute_for_serialization :send
  

  enum role: [:customer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :customer
  end

  belongs_to :town
  belongs_to :division
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo, url: "/system/:hash.:extension", hash_secret: "abc123", styles: { thumb: ["64x64#", :jpg] }, path: ":rails_root/public/system/test/:attachment"

  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/png", "image/jpeg"]
 


end
