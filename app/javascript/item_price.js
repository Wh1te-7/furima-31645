window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (priceInput){
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
      addTaxDom.innerHTML = Math.floor(inputValue * 0.10)
      profitDom.innerHTML = Math.floor(inputValue - inputValue * 0.10)
  })
}

})
