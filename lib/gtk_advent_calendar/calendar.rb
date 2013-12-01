require "gtk3"

module GtkAdventCalendar
  class Calendar < Gtk::Frame
    LAST_DAY = 25
    CELL_WIDTH = 40

    def initialize
      super
      @day = 1
      add(month)
    end

    def month
      box = Gtk::Box.new(:vertical)
      box.add(days_of_the_week)
      while @day <= LAST_DAY do
        box.add(week)
      end
      box
    end

    def days_of_the_week
      box = Gtk::Box.new(:horizontal)
      %w(Sun Mon Tue Wed Thu Fri Sat).each do |day_of_the_week|
        label = Gtk::Label.new("#{day_of_the_week}.")
        label.width_request = CELL_WIDTH
        box.add(label)
      end
      box
    end

    def week
      box = Gtk::Box.new(:horizontal)
      7.times do
        break if @day > LAST_DAY
        box.add(day(@day))
        @day += 1
      end
      box
    end

    def day(n)
      button = Gtk::Button.new(:label => n.to_s)
      button.width_request = CELL_WIDTH
      button.height_request = CELL_WIDTH
      button.signal_connect("clicked") do
        action(n)
      end
      button
    end

    def action(n)
      show_uri("http://en.wikipedia.org/wiki/December_#{n}")
    end

    def show_uri(uri)
      case RUBY_PLATFORM
      when /darwin/
        system("open", uri)
      when /mswin|mingw|cygwin|bccwin/
        system("start", uri)
      else
        if Gtk.respond_to?(:show_uri)
          Gtk.show_uri(uri)
        else
          system("firefox", uri)
        end
      end
    end
  end
end
