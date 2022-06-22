class Author < ActiveRecord::Base
    has_many :books

    def self.alphabetical_order
        self.order(:name)
        puts "hello"
    end

    def self.order_by_birth_year
        self.order(:birth_year)
    end

    def self.oldest_author
        self.order(:birth_year).last
    end
    def self.youngest_author
        self.order(:birth_year).first
    end
end