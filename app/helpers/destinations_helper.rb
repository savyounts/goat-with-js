module DestinationsHelper

  def random_image
    "#{rand(7)}.jpg"
  end

  def random_class
    "random-background-#{rand(1..7)}"
  end
end
