import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Primary script function to retrieve NFT IDs from the public collection of an account
pub fun main(accountAddress: Address): [UInt64] {
    
    // Obtain a reference to the publicly accessible NFT collection of the account
    let collectionReference = getAccount(accountAddress)
        .getCapability(/public/CryptoPoopsCollection)
        .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
        ?? panic("No associated collection found for the given address.")

    // Fetch NFT IDs from the public collection by invoking the getIDs function
    return collectionReference.getIDs()
}
