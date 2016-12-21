contract artRegistry {

  // TODO: map validator address and more...
  
  /**
  * @author Artchain.org
  * @notice Registers artwork on the ethereum blockchain, allowing users to appraise.
  * @dev This contract is still under development.
  */
  event RegisteredArt(uint artId);

  struct Artwork {
      string artistName; // name of artist
      string titleofwork; // title of artwork
      uint dateCreated; // dateCreated in timestamp
      uint issueDate; // issueDate in timestamp
      Appraiser[] appraisers;
  }
  Artwork[] artworks; // will improve later

  struct Appraiser {
      string name;
      string review;
  }
  // returns total number of artworks on registry
  function totalArts() constant returns (uint res) {
    return artworks.length;
  }

  function artDetails(uint artId) constant returns(
    string titleofwork, 
    string artistname, 
    uint datecreated, 
    uint issuedate) {

      return (
          artworks[artId].titleofwork,
          artworks[artId].artistName,
          artworks[artId].dateCreated,
          artworks[artId].issueDate
      );
  }
  
  function publishArtwork(string titleofwork, string artistName, uint dateCreated) returns(uint artId) {
    
    if(bytes(titleofwork).length == 0 || bytes(artistName).length == 0) {
        throw;
    }
    
    artId = artworks.length++;
    artworks[artId].titleofwork = titleofwork;
    artworks[artId].artistName = artistName;
    artworks[artId].dateCreated = dateCreated;
    artworks[artId].issueDate = block.timestamp;

    RegisteredArt(artId);
  }
}
