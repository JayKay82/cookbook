module RecipeHelper
  # Got this solution from and modified it to serve my purpose which was to convery minutes instead of seconds:
  # http://stackoverflow.com/questions/4136248/how-to-generate-a-human-readable-time-range-using-ruby-on-rails
  def humanize mins
    [[60, :min], [24, :hr], [1000, :day]].map{ |count, name|
      if mins > 0
        mins, n = mins.divmod(count)
        pluralize(n.to_i, name.to_s)
      end
    }.compact.reverse.join(' ')
  end
end
