window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
    
     addTaxDom.innerHTML = Math.math.floor(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     
     addPofitDom.innerHTML = math.floor(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});