onload = function(){
  const textContents = document.querySelectorAll('.text');
  const moreButton = document.querySelectorAll('.more');
  for(let i = 0; i < textContents.length; i++){
    console.log(textContents[i].clientHeight)
    if(textContents[i].clientHeight < 200){
      moreButton[i].style.display = 'none';
    }
    moreButton[i].addEventListener('click', function(){
      console.log("test")
      textContents[i].classList.toggle('is-open');
      moreButton[i].classList.toggle('is-open1');
    },false);
  }
  // for(let i = 0; i < moreButton.length; i++){
  //   console.log(i)
  // }
  // const textHeight = textContents.clientHeight;
  // let MaxHeight = getComputedStyle(textContents).getPropertyValue('max-height');
  // MaxHeight = MaxHeight.replace(/[^-\d\.]/g, '');
  // if(MaxHeight > textHeight) {
  //   moreButton.style.display = 'none';
  // }

  // // Moreボタンを押したら、テキスト要素のis-openクラスを切り替え
  // moreButton.addEventListener('click', function(){
  //   textContents.classList.toggle('is-open');
  //   moreButton.classList.toggle('is-open1');
  // },false);

  // for(let i = 0; i < textContents.length; i++){
  //   console.log(i)
  // }

  //for(var i = 0; i < textContents.length; i++){
  //  if(textHeight > 200)  {
  //    moreButton.style.display = 'none';
  //  } else{
  //    moreButton.indexOf(i).style.display = 'block';
  //  }
  //}
}