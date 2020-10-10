// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

window.addEventListener('load', function(){

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

  const PriceIncludeTax = document.getElementById("item-price")
  PriceIncludeTax.addEventListener('input', function(){
    var price = document.getElementById("item-price").value;
    document.getElementById("add-tax-price").innerHTML = Math.round(price * 0.1);
    document.getElementById("profit").innerHTML = Math.round(price * 0.9);
  })
})

 