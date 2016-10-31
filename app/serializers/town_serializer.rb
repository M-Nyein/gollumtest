class TownSerializer < ActiveModel::Serializer
  attributes :id, :name, :division
  # belongs_to :division
  has_many :users
  def division
  	DivisionSerializer.new(object.division)#.attributes[:name]
  	# a = object.division
  end

end
