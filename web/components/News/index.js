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


}

customElements.define('news-list', News)
