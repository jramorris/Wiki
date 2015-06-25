module ApplicationHelper
	def rand_time(from, to=Time.now)
  	Time.at(rand_in_range(from.to_f, to.to_f))
	end
end
