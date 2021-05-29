pragma solidity ^0.7.4;

contract OnYouFit {
  // INSERT struct Product
  struct Product {
  string name;
  string description;
  string upiID;
  bool isActive; // is product active
  uint256 price; 
  address owner; // Owner of the product

}

  // Unique and sequential productId for every new product
  uint256 public productId;

  // mapping of productId to Product object
  mapping(uint256 => Product) public products;

  // INSERT struct Booking

  struct Buyin {
    uint256 productId;
    uint256 quantity;
    address user;
    string pmode;
  }

  uint256 public buyinId;

  // mapping of bookingId to Booking object
  mapping(uint256 => Buyin) public buyins;

  // This event is emitted when a new product is put up for sale
  event NewProduct (
    uint256 indexed productId
  );

  // This event is emitted when a NewBooking is made
  event NewBooking (
    uint256 indexed productId,
    uint256 indexed buyinId
  );

  /**
    * @dev Put up your funky space on the market
    * @param name Name of the product
    * @param description Short description of your product
    * @param price Price per day in wei (1 ether = 10^18 wei)
    */
function listProduct(string memory name, string memory description,string memory upiID, uint256 price) public {
  Product memory product = Product({
    name: name,
    description: description,
    upiID: upiID,
    isActive: true,
    price: price,
    owner: msg.sender
  });

  // Persist `product` object to the "permanent" storage
  products[productId] = product;

  // emit an event to notify the clients
  emit NewProduct(productId++);
}
  /**
   * @dev Make a Buy Order
   * @param _productId id of the product to rent out
   * @param _pmode id of the product to rent out
   */
  function buyProduct(uint256 _productId, uint256 quantity, string calldata _pmode) public payable{
    // Retrieve `product` object from the storage
    Product storage product = products[_productId];

    // Assert that product is active
    // Assert that product is active
    require(
      product.isActive == true,
      "Product is not available"
    );    
    if(keccak256(bytes(_pmode)) == keccak256(bytes("t"))){
    //   require(
    //     msg.value == parseInt(toWei(((product.price * (quantity))/133999).toString(), 'ether')),
    //     "Sent insufficient funds"
    //   );
      _sendFunds(product.owner, msg.value);
      _createBuyin(_productId, quantity, _pmode);
    }
    // conditions for a booking are satisfied, so make the booking
    if(keccak256(bytes(_pmode)) == keccak256(bytes("f"))){
      _createBuyin(_productId, quantity, _pmode);
    }
    
  }

  function _sendFunds (address beneficiary, uint256 value) internal {
    // address(uint160()) is a weird solidity quirk
    // Read more here: https://solidity.readthedocs.io/en/v0.5.10/050-breaking-changes.html?highlight=address%20payable#explicitness-requirements
    address payable(uint160(beneficiary)).transfer(value);
  }

  function _createBuyin(uint256 _productId, uint256 quantity, string calldata _pmode) internal {
    // Create a new booking object
    Buyin memory buyin = Buyin({
      productId: _productId,
      quantity : quantity,
      user: msg.sender,
      pmode : _pmode 
    });

    // persist to storage
    buyins[buyinId] = buyin;


    

    // Emit an event to notify clients
    emit NewBooking(_productId, buyinId++);
  }

  /**
   * @dev Take down the product from the market
   * @param _productId Product ID
   */
  function markProduct(uint256 _productId) public {
    require(
      products[_productId].owner == msg.sender,
      "THIS IS NOT YOUR PRODUCT"
    );
    if(products[_productId].isActive==true){
        products[_productId].isActive = false;
    }
    else{
        products[_productId].isActive = true;
    }
  }
}
