require "gtk_advent_calendar"

class YourCalendar < GtkAdventCalendar::Calendar
  # @params n [Integer] the day between 1 and 25.
  def action(n)
    puts "It's December #{n}."
  end
end

window = Gtk::Window.new
window.add(YourCalendar.new)
window.signal_connect("destroy") do
  Gtk.main_quit
end
window.show_all
Gtk.main
