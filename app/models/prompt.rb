require 'bazaar'

class Prompt
  def self.get_array
    [Bazaar.item, Bazaar.super_adj, Bazaar.super_item]
  end

  def self.get_item
    [Bazaar.item, Bazaar.super_adj, Bazaar.super_item].sample
  end
end