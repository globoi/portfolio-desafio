//@ts-check

/**
 * @typedef {import('../../types/news').Article} Article
 */

/**
 * @funtion fetchNews
 * @description Fetches news from the API
 * @returns {Promise<Article[]>}
 */
const fetchTopNews = async () => {
  const response = await fetch(`http://localhost:3000/feed/top3`)
  /** @type {Article[]} */
  const news = await response.json()

  return news
}

fetchTopNews().then((news) => {
  news.forEach((article, index) => {
    const div = document.querySelector(`.news__top--${index}`)
    const a = document.createElement('a')
    a.setAttribute('href', `${article.url}`)
    a.innerHTML = `
      <span>${article.chapeu || article.section}</span>
      <h1>${article.title}</h1>
      <p>${article.summary}</p>
    `

    div?.appendChild(a)
    div?.setAttribute('style', `background-image: url("${article.image}")`)
  })
})
