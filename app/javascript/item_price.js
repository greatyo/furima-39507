window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    addTaxDom.innerHTML = Math.floor(priceInput.value / 10);
    addProfitDom.innerHTML = priceInput.value - Math.floor(priceInput.value / 10);
  })
})


(Math.floor(priceInput / 10));