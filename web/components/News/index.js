//@ts-check
/**
 * @typedef {import('../../types/news').Article} Article
 */

class News extends HTMLElement {
  static observedAttributes = ['page']
  constructor() {
    super()
    this.currentPage = +(this.getAttribute('page') || 1)
    this.totalItems = 0
    this.totalAds = 0
    this.addsAfter = 8
    this.shadow = this.attachShadow({ mode: 'open' })
    this.ads = []
  }

  /**
   * @method minMax
   * @description Returns a random number between min and max
   * @param {number} min
   * @param {number} max
   * @returns {number}
   */
  minMax(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min)
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
   * @param {Element} ul
   * @returns {Element}
   */
  createArticles(news, ul) {
    news.forEach((article, index) => {
      if (article.title === undefined) return
      const li = document.createElement('li')
      li.classList.add('article__item')
      if (index === this.addsAfter) {
        const ad = this.ads[this.minMax(0, this.ads.length - 1)]
        li.innerHTML = `
          <div class="article__image">
            <a href="${article.url}" class="article__image--wrapper">
              <img src="https://picsum.photos/500/300" alt=${ad.chapeu} />
            </a>
          </div>
          <div class="article__text">
            <span class="article__chapeu--ad">${ad.chapeu}</span>
            <a href="${article.url}" class="article__title">
              <h2 class="article__title">${ad.title}</h2>
            </a>
            <p>${ad.summary}</p>
            <span class="article__date">${ad.section}</span>
          </div>
        `
      } else {
        li.innerHTML = `
        <div class="article__image">
          <div class="article__image--wrapper">
            <a href="${article?.video?.duration ? '' : article.url}">
              <img src=${article.image} alt=${article.title} />
            </a>
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
        const video = document.createElement('video')
        video.src = article.video.source
        video.controls = true
        video.classList.add('article__video')
        video.setAttribute('data-name', article.title)

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
          this.openModal(video)
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

  /**
   * @funtion fetchAds
   * @description Fetches ads from the API
   * @returns {Promise<Article[] | []>}
   */
  async fetchAds() {
    try {
      const response = await fetch(`http://localhost:3000/ads`)
      /** @type {Article[]} */
      const res = await response.json()

      return res.length > 0 ? res : []
    } catch (error) {
      console.log(error)
      return []
    }
  }

  /**
   * @method connectedCallback
   */
  async connectedCallback() {
    const sheet = await fetch('./components/News/styles.css')
    const sheetText = await sheet.text()
    const style = document.createElement('style')
    style.textContent = sheetText
    this.shadow.appendChild(style)

    const div = document.createElement('div')
    div.classList.add('article__container')
    this.shadow.appendChild(div)

    let ul = document.createElement('ul')
    ul.classList.add('article__list')

    div.appendChild(ul)
  }

  async attributeChangedCallback(name, oldValue, newValue) {
    this.ads = await this.fetchAds()
    const [news, errorDiv] = await this.fetchNews(newValue)

    if (news?.length && news.length > 0) {
      let ul = this.shadow.querySelector('ul.article__list')

      if (!ul) return

      ul = this.createArticles(news, ul)

      const div = this.shadow.querySelector('.article__container')
      if (div) {
        const button = document.createElement('button')
        button.classList.add('article__button')
        button.textContent = 'Leia Mais'
        button.addEventListener('click', async () => {
          this.currentPage += 1
          this.setAttribute('page', String(this.currentPage))
        })
        div?.appendChild(ul)

        if (newValue > 1) {
          const previousButton = this.shadow.querySelector(
            'button.article__button'
          )
          if (previousButton) {
            previousButton.remove()
          }
        }
        div.appendChild(button)
        this.shadow.appendChild(div)
      }
    } else if (errorDiv) {
      this.shadow.appendChild(errorDiv)
    }
  }

  /**
   * @method openModal
   * @description Opens a modal with the component passed as a parameter
   * @param {Element} component
   */
  openModal(component) {
    const modal = document.createElement('dialog')
    const div = document.createElement('div')
    const divWrapper = document.createElement('div')
    const span = document.createElement('span')
    const title = document.createElement('h2')

    span.textContent = 'X'
    title.textContent = component.getAttribute('data-name') || 'Vídeo'

    span.classList.add('modal__close')
    modal.classList.add('modal')
    div.classList.add('modal__container')
    title.classList.add('modal__title')
    divWrapper.classList.add('modal__wrapper')

    div.appendChild(span)
    divWrapper.appendChild(title)
    divWrapper.appendChild(component)
    div.appendChild(divWrapper)
    modal.appendChild(div)
    document.body.appendChild(modal)

    modal.showModal()

    modal.addEventListener('click', (event) => {
      if (
        event.target === modal ||
        event.target === span ||
        event.target === div
      ) {
        const video = modal.querySelector('video')
        if (video) {
          video.pause()
        }
        this.closeModal()
      }
    })
  }

  /**
   * @method closeModal
   * @description This method closes any open modal on the page.
   */
  closeModal() {
    const modal = document.querySelector('dialog')
    if (modal) {
      modal.remove()
    }
  }
}

customElements.define('news-list', News)
