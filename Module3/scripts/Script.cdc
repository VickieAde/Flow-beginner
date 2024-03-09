// Import CountryStruct Contract
import CountryStruct from 0x01

pub fun main(id: UInt64): CountryStruct.Country? {
    // Retrieve a Country by its unique Id using the imported contract
    return CountryStruct.getCountry(id: id)!
}
