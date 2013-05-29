class Species
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :density, type: Float
  field :strength_property, type: Float
  field :leaf, type: Object
  field :bark_texture, type: Filepath
  field :annual_accumulation, type: Float
end