// Import CountryStruct Contract
import CountryStruct from 0x01

// Transaction to add a country
transaction(id: UInt64, name: String, population: UInt64) {
    
    // Prepare phase: No account modifications needed
    prepare(acct: AuthAccount) {}

    // Execution phase: Add a Country using the imported contract
    execute {
      CountryStruct.addCountry(id: id, name: name, population: population)
      log("Country Added Successfully")
    }
}
