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
const fetchNews = async (page = 1) => {
  const response = await fetch(`http://localhost:3000/feed/page/${page}`)
  /** @type {Article[]} */
  const news = await response.json()

  return news
}
