require("dotenv").config();
const address = "${process.env.PRIVATE_KEY}"
const Web3 = require("web3")
const web3 = new Web3("${process.env.URL}${process.env.API_KEY}")
web3.eth.getBalance(address, function(err, result) {
  if (err) {
    console.log(err)
  } else {
    console.log(web3.utils.fromWei(result, "ether") + " ETH")
  }
})
