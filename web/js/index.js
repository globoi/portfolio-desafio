let numberNews = 0

function addSourceToVideo(element, src, type) {
  var source = document.createElement('source');
  source.src = src;
  source.type = type;
  element.appendChild(source);
}

function mountList(data, number){
  for (let i = number; i < data.length; i++) {

    if(data[i].title){
      let div = document.createElement('div')
      div.classList.add('blocknmiddle')
      if(data[i].video==null){
        div.onclick = function(){
          location.href = data[i].url;return false;
        };
      } else {
        div.onclick = function(){
          const addvideo = document.getElementById("addvideo");

          let videoH = document.createElement('h1')
          videoH.innerHTML = data[i].title

          let videoS = document.createElement('video')
          videoS.controls = true;
          addSourceToVideo(videoS, data[i].video.source, 'video/mp4');
          videoS.play();

          addvideo.appendChild(videoH);
          addvideo.appendChild(videoS);
          
          const modal = document.getElementById("modal");
          modal.appendChild(addvideo);
          modal.style.display = "block";
          modal.style.opacity = "0";
          setTimeout(function(){modal.style.opacity = "1";}, 500);
        }
      }

      let spanSubtimeMob = document.createElement('span')
      spanSubtimeMob.classList.add('subtimemob')
      spanSubtimeMob.innerHTML = data[i].created

      let img = document.createElement('img')
      img.classList.add('news')
      if(!data[i].image){
        img.src = 'https://picsum.photos/270/152'
      } else {
        img.src = data[i].image
      }

      div.appendChild(spanSubtimeMob);
      div.appendChild(img);

      if(data[i].video!==null){
        let imgPlay = document.createElement('img')
        imgPlay.classList.add('play')
        imgPlay.src = './images/play.svg'
        div.appendChild(imgPlay);
      }

      let divBlocText = document.createElement('div')
      divBlocText.classList.add('blctext')

      let spanLive = document.createElement('span')
      //spanLive.classList.add('live')
      spanLive.classList.add('categoryb')
      spanLive.innerHTML = data[i].section

      let h2Red = document.createElement('h2')
      h2Red.classList.add('red')
      h2Red.innerHTML = data[i].title

      let spanSubtime = document.createElement('span')
      spanSubtime.classList.add('subtime')
      spanSubtime.innerHTML = data[i].created

      divBlocText.appendChild(spanLive);
      divBlocText.appendChild(h2Red);
      divBlocText.appendChild(spanSubtime);
      
      div.appendChild(divBlocText);
      document.getElementById("listNews").appendChild(div)

      var remainder = numberNews % 8;
      
      if (remainder == 0){

        let divAd = document.createElement('div')
        divAd.classList.add('adblock')

        let spanAd = document.createElement('span')
        spanAd.classList.add('adspan')
        spanAd.innerHTML = "Anúncio"

        let imgAd = document.createElement('img')
        imgAd.src = 'https://picsum.photos/270/100'

        divAd.appendChild(spanAd)
        divAd.appendChild(imgAd)

        document.getElementById("listNews").appendChild(divAd)
      }
    }
    numberNews++;
  }
}

function initPage(data){
  document.getElementById("topLChapeu").textContent = data[0].chapeu
  document.getElementById("topLTitle").textContent = data[0].title
  document.getElementById("topLDescription").textContent = data[0].summary
  document.getElementById("firstnews").onclick = function(){
    location.href = data[0].url;return false;
  };

  document.getElementById("titlePhoto").textContent = data[1].title
  document.getElementById('imgTopRight').style.backgroundImage = "url("+data[1].image+")"
  document.getElementById("imgTopRight").onclick = function(){
    location.href = data[1].url;return false;
  };

  document.getElementById('imgTopMobile').src = data[1].image;
  numberNews = 3
  mountList(data, 3)
}


async function fetchData(pageNumber) {
  let response = await fetch('http://localhost:3000/feed/page/'+pageNumber)
  //https://projetos.thbastos.com/desafio-globo/json/page1.json
  let data = await response.json()
  initPage(data)

  // let buttonMore = document.createElement('button')
  // buttonMore.classList.add('morenews')
  // buttonMore.innerHTML = "Veja mais"
  // document.getElementById("listNews").appendChild(buttonMore)
}

fetchData(1);

async function loadMore(){

  const body = document.querySelector("body")
  const pageNumber = parseInt(body.dataset.page) + 1
  body.dataset.page = pageNumber

  let response = await fetch('http://localhost:3000/feed/page/'+pageNumber)
  //https://projetos.thbastos.com/desafio-globo/json/page1.json
  let data = await response.json()

  if(pageNumber<11)
    mountList(data, 0)
  else
    document.getElementById("bloadmore").remove()
}

window.addEventListener('scroll',()=>{
  const {scrollTop,clientHeight,scrollHeight} = document.documentElement;
  if ((scrollTop+clientHeight)>=scrollHeight) {
    loadMore()
    window.scrollTo(0,scrollTop-100)
  }
});

function openModal(){
  const x = document.getElementById("modal");

  x.style.display = "block";
  x.style.opacity = "0";
  setTimeout(function(){x.style.opacity = "1";}, 500);

}

function closeModal(){
  const x = document.getElementById("modal");
  const addvideo = document.getElementById("addvideo");
  addvideo.innerHTML = "";
  x.style.opacity = "0";
  x.style.transition = "1s opacity";
  setTimeout(function(){x.style.display = "none"}, 500);
}