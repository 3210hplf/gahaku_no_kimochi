module ShiritoriGamesHelper
  def shiritori_status_class(status)
    case status
      when "in_progress"
        'info'
      when "success"
        'success'
      when "failure"
        'warning'
      end
    end
  end