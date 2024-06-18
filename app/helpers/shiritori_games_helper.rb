module ShiritoriGamesHelper
  def shiritori_status_class(status)
    case status
      when "in_progress"
        'bg-yellow-100 border-yellow-400 text-yellow-700'
      when "success"
        'bg-green-100 border-green-400 text-green-700'
      when "failure"
        'bg-red-100 border-red-400 text-red-700'
      end
    end
  end
