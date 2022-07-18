module BookingsHelper
  def normalize_start_time(start_time)
    start_time.strftime "%H:%M"
  end

  def normalize_end_time(end_time)
    end_time.strftime "%H:%M"
  end

  def date_range(start_time, end_time)
    "#{normalize_start_time(start_time)} - #{normalize_end_time(end_time)}"
  end
end
