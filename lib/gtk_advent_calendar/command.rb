require "gtk3"
require "gtk_advent_calendar/calendar"

module GtkAdventCalendar
  class Command
    class << self
      def run
        window = Gtk::Window.new
        window.title = "Advent Calendar"
        window.add(Calendar.new)
        window.signal_connect("destroy") do
          Gtk.main_quit
        end
        window.show_all
        Gtk.main
      end
    end
  end
end
