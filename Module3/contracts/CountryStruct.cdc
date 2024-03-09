pub contract CountryStruct {

    // Structure definition for a Country entity
    pub struct Country {
        pub let id: UInt64 // Unique identifier assigned to the country
        pub let name: String // Official name of the country
        pub let population: UInt64 // Total population of the country

        // Constructor method to initialize a Country instance
        init(id: UInt64, name: String, population: UInt64) {
            self.id = id
            self.name = name
            self.population = population
        }
    }

    // Storage of countries using their unique Ids as keys in a dictionary
    pub var countries: {UInt64: Country}

    // Contract initialization with an empty dictionary for countries
    init() {
        self.countries = {}
    }

    // Method to add a new Country to the dictionary using its unique Id
    pub fun addCountry(id: UInt64, name: String, population: UInt64) {
        let country = Country(id: id, name: name, population: population)
        self.countries[id] = country
    }

    // Method to retrieve a Country by its unique Id from the dictionary
    pub fun getCountry(id: UInt64): Country? {
        return self.countries[id]
    }
}
