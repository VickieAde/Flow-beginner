import NonFungibleToken from 0x05
import CryptoPoops from 0x05

transaction(recipientAccount: Address, _name: String, _favFood: String, _luckyNo: Int) {
  prepare(signer: AuthAccount) {
    // Acquire a reference to the NFT minter
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

    // Retrieve a reference to the recipient's publicly accessible NFT collection
    let recipientCollectionRef = getAccount(recipientAccount)
      .getCapability(/public/CryptoPoopsCollection)
      .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
      ?? panic("No associated collection found for the address.")

    // Generate a new NFT using the minter reference
    let nft <- minter.createNFT(name: _name, favouriteFood: _favFood, luckyNumber: _luckyNo)
    
    // Add the newly minted NFT to the recipient's collection
    recipientCollectionRef.deposit(token: <- nft)
  }

  execute {
    log("NFT creation and deposit completed successfully")
  }
}
