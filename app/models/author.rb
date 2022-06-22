class Author < ActiveRecord::Base
    has_many :books

    def self.alphabetical_order
        all.order(:name)
    end

    def self.order_by_birth_year
        all.order(:birth_year)
    end

    def self.oldest_author
        all.order(:birth_year).last
    end
    def self.youngest_author
        all.order(:birth_year).first
    end
end