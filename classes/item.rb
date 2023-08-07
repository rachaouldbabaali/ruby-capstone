class Item


  def can_be_archived?
    true
  end

  def move_to_archive!
    @archived = true
  end
end