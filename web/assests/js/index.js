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

fetchTopNews().then((news) => {
  news.forEach((article, index) => {
    const div = document.querySelector('.aside__header')
    const divRelatedNews = document.createElement('div')
    divRelatedNews.setAttribute('class', 'aside__news')
    divRelatedNews.innerHTML = `
      <a href="${article.url}">
        <h3>${article.title}</h3>
      </a>
      <a href="${article.url}"><img src="${article.image}" alt="${article.section}" class="aside__news--img" /></a>
    `

    div?.nextElementSibling?.appendChild(divRelatedNews)
  })
})
