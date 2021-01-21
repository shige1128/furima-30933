window.addEventListener('load', function(){
 
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue / 10);
      const profitAmount = document.getElementById("profit");
      profitAmount.innerHTML = inputValue - addTaxDom.innerHTML;
  })
})