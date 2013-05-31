class Segment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :origin  # { z, rot, div } in relation to tree.origin
  field :length, :type => Float
  field :bezier_control_points, :type => Array
  recursively_embeds_many :segments
end