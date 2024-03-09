import CryptoPoops from 0x05

transaction() {
  prepare(signer: AuthAccount) {
    // Verify if there is an existing collection in the account's storage.
    if signer.borrow<&CryptoPoops.Collection>(from: /storage/CryptoPoopsCollection) != nil {
      log("A collection already exists.")
      return
    }

    // Generate a new collection in the account's storage.
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/CryptoPoopsCollection)

    // Establish public accessibility for the collection.
    signer.link<&CryptoPoops.Collection>(/public/CryptoPoopsCollection, target: /storage/CryptoPoopsCollection)

    log("Collection has been successfully created.")
  }
}


