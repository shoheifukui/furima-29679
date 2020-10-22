if (document.URL.match( /new/ )) {
const price = () => {
  
  const channels = require.context('.', true, /_channel\.js$/)
  channels.keys().forEach(channels)

  const PriceIncludeTax = document.getElementById("item-price")
  PriceIncludeTax.addEventListener('input', function(){
    var price = document.getElementById("item-price").value;
    document.getElementById("add-tax-price").innerHTML = Math.round(price * 0.1);
    document.getElementById("profit").innerHTML = Math.round(price * 0.9);
  });
};

window.addEventListener("load", price);
};