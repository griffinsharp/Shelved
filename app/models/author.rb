class Author < ApplicationRecord

    def coordinates
        [rand(90), rand(90)]
    end
    
    # Makes an array of random length between 1 and 10. 
    # Maps over the array, replacing the empty value with a num bet 1800 and 1900.
    def publication_years
        (1..rand(10)).to_a.map { 1900 - rand(100) }
    end

end
