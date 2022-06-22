class Author < ActiveRecord::Base
    has_many :books

    def self.alphabetical_order
        all.order(:name)
    end

end