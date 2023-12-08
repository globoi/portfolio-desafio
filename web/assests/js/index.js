//@ts-check

/**
 * @typedef {import('../../types/news').Article} Article
 */

/**
 * @funtion fetchNews
 * @description Fetches news from the API
 * @param {string | number} page
 * @returns {Promise<Article[]>}
 */
const fetchTopNews = async () => {
  const response = await fetch(`http://localhost:3000/feed/top3`)
  /** @type {Article[]} */
  const news = await response.json()

  return news
}
