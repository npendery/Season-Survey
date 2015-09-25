class Search < ActiveRecord::Base
	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
