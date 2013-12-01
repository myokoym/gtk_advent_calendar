# GtkAdventCalendar

An advent calendar by Ruby/GTK3.

## Requirements

* Ruby/GTK3 in [Ruby-GNOME2](http://ruby-gnome2.sourceforge.jp/)

## Installation

Add this line to your application's Gemfile:

    gem 'gtk_advent_calendar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gtk_advent_calendar

## Usage

### For Command Line Application

    $ gtk_advent_calendar

### For Library

```ruby
require "gtk_advent_calendar"

class YourCalendar < GtkAdventCalendar::Calendar
  # @params n [Integer] the day between 1 and 25.
  def action(n)
    ...
  end
end

window = Gtk::Window.new
window.add(YourCalendar.new)
window.show_all
Gtk.main
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
