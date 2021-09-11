function post (){
  const price = document.getElementById("item-price");
  price.addEventListener('input', ()=> {
    
    const inputValue = price.value;

    const commissionRate = 0.1;
    const priceCommission = document.getElementById("add-tax-price");
    priceCommission.innerHTML = inputValue * commissionRate;

    const priceGain = document.getElementById("profit");
    priceGain.innerHTML = inputValue - priceCommission.innerHTML;
  });
};

window.addEventListener('load', post);