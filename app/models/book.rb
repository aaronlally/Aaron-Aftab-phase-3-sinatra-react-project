class Book < ActiveRecord::Base
    belongs_to :author

    def self.alphabetical_order
        all.order(:title)
    end
    def self.order_by_rating
        all.order(:rating)
    end
    def self.order_by_release_date
        all.order(:release_date)
    end
    def self.highest_rating
        all.order(:rating).last
    end
    def self.lowest_rating
        all.order(:rating).first
    end
    def self.popular_books
        all.where("rating > ?", 5)
    end
    def self.unpopular_books
        all.where("rating < ?", 5)
    end
end