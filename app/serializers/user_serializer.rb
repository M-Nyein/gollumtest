class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :town_id, :town
  # attributes :town
  belongs_to :town
  def town


#   	serializer_options = {}
# serializer = SomeSerializer.new(resource, serializer_options)
# serializer.attributes
# serializer.associations


	puts "******"
	puts TownSerializer.new(object.town).attributes[:name]
		# UserSerializer.new(object.user).attributes[:user_name]
	puts "zzzz"
	# user_serializer_options = {}
	# DivisionSerializer.new(Division.find(f))
  end
end
