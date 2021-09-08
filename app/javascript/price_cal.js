function post (){
  const price = document.getElementById("item-price");
  price.addEventListener('input', ()=> {
    
    // priceの値を代入
    const inputValue = price.value;
    // 販売手数料
    const commissionRate = 0.1;
    const priceCommission = document.getElementById("add-tax-price");
    priceCommission.innerHTML = inputValue * commissionRate;
    // 販売利益
    const priceGain = document.getElementById("profit");
    priceGain.innerHTML = inputValue - priceCommission.innerHTML;
  });
};

window.addEventListener('load', post);