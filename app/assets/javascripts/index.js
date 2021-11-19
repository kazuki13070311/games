onload = function(){
  const textContents = document.querySelector('.text');
  const moreButton = document.querySelector('.more');
  const textHeight = textContents.clientHeight;
  let MaxHeight = getComputedStyle(textContents).getPropertyValue('max-height');
  MaxHeight = MaxHeight.replace(/[^-\d\.]/g, '');
  //if(MaxHeight > textHeight) {
  //  moreButton.style.display = 'none';
  //}

  // Moreボタンを押したら、テキスト要素のis-openクラスを切り替え
  moreButton.addEventListener('click', function(){
    textContents.classList.toggle('is-open');
    moreButton.classList.toggle('is-open1');
  },false);

  //for(var i = 0; i < textContents.length; i++){
  //  if(textHeight > 200)  {
  //    moreButton.style.display = 'none';
  //  } else{
  //    moreButton.indexOf(i).style.display = 'block';
  //  }
  //}
}