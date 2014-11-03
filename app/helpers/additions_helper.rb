module AdditionsHelper
  def get_new_addition
    addition ||= Addition.new
  end
end
