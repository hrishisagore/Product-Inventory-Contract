// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ProductInventory {
    struct Product {
        string name;
        uint price;
        uint stock;
    }

    mapping(uint => Product) public products;
    uint public productCount;

    // Event to log product additions
    event ProductAdded(uint productId, string name, uint price, uint stock);

    // Function to add a new product
    function addProduct(string memory _name, uint _price, uint _stock) public {
        productCount++;
        products[productCount] = Product(_name, _price, _stock);
        emit ProductAdded(productCount, _name, _price, _stock);
    }

    // Function to get product details
    function getProduct(uint _productId) public view returns (string memory, uint, uint) {
        Product memory p = products[_productId];
        return (p.name, p.price, p.stock);
    }

    // Function to update product stock
    function updateStock(uint _productId, uint _newStock) public {
        products[_productId].stock = _newStock;
    }
}
