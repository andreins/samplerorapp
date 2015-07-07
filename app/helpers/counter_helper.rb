module CounterHelper

  @@times_clicked = 0

  def increase_counter()
    @@times_clicked += 1
    @@times_clicked
  end

  def get_counter()
    @@times_clicked
  end
end
