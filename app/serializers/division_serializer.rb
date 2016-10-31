class DivisionSerializer < ActiveModel::Serializer
  # embed :ids
  attributes :id, :name
  # has_many :towns
end
