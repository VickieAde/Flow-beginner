import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Retrieve a non-fungible token (NFT) reference for a specific ID
pub fun main(acctAddress: Address, id: UInt64): &NonFungibleToken.NFT {
    // Acquire a reference to the public collection associated with the provided address
    let contract = getAccount(acctAddress).getCapability(/public/CryptoPoopsCollection)
      .borrow<&CryptoPoops.Collection>() ?? panic("Unable to obtain a reference to the collection")
    
    // Obtain a reference to the NFT metadata using the borrowAuthNFT function
    let nftData = contract.borrowAuthNFT(id: id)
  
    // Provide the borrowed NFT reference as the result
    return nftData
}


