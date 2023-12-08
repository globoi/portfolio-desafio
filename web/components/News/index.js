//@ts-check
/**
 * @typedef {import('../../types/news').Article} Article
 */

class News extends HTMLElement {
  constructor() {
    super()
    this.currentPage = +(this.getAttribute('page') || 1)
    this.totalItems = 0
    this.totalAds = 0
    this.newsTest = []
    const font = document.createElement('link')
    font.href =
      'https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap'
    font.rel = 'stylesheet'
    document.head.appendChild(font)
  }

  /**
   * @function formatDuration
   * @description Formats the duration of the video
   * @param {number} duration
   * @returns {string}
   */
  formatDuration(duration) {
    duration = duration / 1000
    let minutes = Math.floor(duration / 60)
    let seconds = Math.floor(duration % 60)

    let strMinutes = (minutes < 10 ? '0' : '') + minutes
    let strSeconds = (seconds < 10 ? '0' : '') + seconds

    return strMinutes + ':' + strSeconds
  }

  /**
   * @method createArticles
   * @description Creates the article list for the news
   * @param {Article[]} news
   * @param {HTMLUListElement} ul
   * @returns {HTMLUListElement}
   */
  createArticles(news, ul) {
    news.forEach((article) => {
      if (article.title === undefined) return
      const li = document.createElement('li')
      li.classList.add('article__item')
      if (index === this.addsAfter) {
        li.innerHTML = `
          <div class="article__image">
            <div class="article__image--wrapper">
              <img src="https://picsum.photos/500/300" alt="Anúncio" />
            </div>
          </div>
          <div class="article__text">
            <span class="article__chapeu--ad">Anúncio</span>
            <a href="#" class="article__title">
              <h2 class="article__title">Anúncio</h2>
            </a>
            <p>Compre o melhor produto do mundo</p>
            <span class="article__date">Agora mesmo</span>
          </div>
        `
      } else {
        li.innerHTML = `
        <div class="article__image">
          <div class="article__image--wrapper">
            <img src=${article.image} alt=${article.title} />
          </div>
        </div>
        <div class="article__text">
          <span class="article__chapeu">${article.chapeu}</span>
          <a href=${article.url} class="article__title">
            <h2 class="article__title">${article.title}</h2>
          </a>
          <div class="article__text--wrapper">
            <span>●</span>
            <a href=${article.url}>${article.summary}</a>
          </div>
          <span class="article__date">${this.formatDate(
            article.created
          )} - Em ${article.section}
          </span>
        </div>
        `
      }
      if (article?.video?.duration) {
        const div = li.querySelector('div.article__image--wrapper')
        const span = document.createElement('span')
        span.innerHTML = `
          <div>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <path d="M8 5v14l11-7z">
              </path>
            </svg>
          </div>
          <span>${this.formatDuration(article.video.duration)}</span>
        `
        span.classList.add('article__video--overlay')
        span.addEventListener('click', () => {
          this.openModal()
        })
        div?.appendChild(span)
      }
      ul.appendChild(li)
    })
    return ul
  }

  /**
   *
   * @param {string} date
   * @returns {string}
   */
  formatDate(date) {
    const createdDate = new Date(date)
    const today = new Date()
    const diffTime = Math.abs(today.getTime() - createdDate.getTime())
    const diffSeconds = Math.ceil(diffTime / 1000)
    const diffMinutes = Math.ceil(diffTime / (1000 * 60))
    const diffHours = Math.ceil(diffTime / (1000 * 60 * 60))
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))

    if (diffSeconds < 60) {
      return `${diffSeconds} segundos atrás`
    } else if (diffMinutes < 60) {
      return `${diffMinutes} minutos atrás`
    } else if (diffHours < 24) {
      return `${diffHours} horas atrás`
    } else {
      return `${diffDays} dias atrás`
    }
  }

  /**
   * @funtion fetchNews
   * @description Fetches news from the API
   * @param {string | number} page
   * @returns {Promise<[Article[] | null, HTMLDivElement | null]>}
   */
  async fetchNews(page = 1) {
    try {
      const response = await fetch(`http://localhost:3000/feed/page/${page}`)
      /** @type {Article[]} */
      let news = await response.json()
      this.totalItems += news.length
      return [news, null]
    } catch (error) {
      console.log(error)
      const errorDiv = document.createElement('div')
      errorDiv.textContent = 'Não foi possível carregar as notícias'
      return [null, errorDiv]
    }
  }

  async connectedCallback() {
    const shadow = this.attachShadow({ mode: 'open' })

    const sheet = await fetch('./components/News/styles.css')
    const sheetText = await sheet.text()
    const style = document.createElement('style')
    style.textContent = sheetText
    shadow.appendChild(style)

    const div = document.createElement('div')
    div.classList.add('article__container')

    const [news, errorDiv] = await this.fetchNews()
    this.totalItems += news?.length || 0
    if (news) {
      const ul = document.createElement('ul')
      ul.classList.add('article__list')

      const updatedUl = this.createArticles(news, ul)

      const button = document.createElement('button')
      button.classList.add('article__button')
      button.textContent = 'Leia Mais'

      button.addEventListener('click', async () => {
        this.currentPage += 1
        this.setAttribute('page', String(this.currentPage))
        const [news, errorDiv] = await this.fetchNews(
          +(this.getAttribute('page') || 1)
        )

        if (news) {
          this.createArticles(news, updatedUl)
        }
      })
      div.appendChild(updatedUl)
      div.appendChild(button)
      shadow.appendChild(div)
    } else if (errorDiv) {
      shadow.appendChild(errorDiv)
    }
  }
  attributeChangedCallback(name, oldValue, newValue) {
    if (name === 'page') {
      console.log(`Page changed from ${oldValue} to ${newValue}`)
      // You can add your ad here based on the new page value
    }
  }
}

customElements.define('news-list', News)
