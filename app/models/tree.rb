class Tree
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one  :species
  embeds_many :segments
end