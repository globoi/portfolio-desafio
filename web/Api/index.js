const express = require('express')
const cors = require('cors')
const app = express()
const PORT = process.env.PORT || 3000
const fs = require('fs')

const minMax = (min, max) => Math.floor(Math.random() * (max - min + 1) + min)

app.use(cors())

app.get('/feed/page/:page', async (req, res) => {
  const page = req.params.page
  try {
    const raw = fs.readFileSync(`./dump/cleared/page_${page}.json`)
    const parsed = JSON.parse(raw)
    res.send(parsed)
  } catch (e) {
    res.send({ message: "We're unable to load this page." })
  }
})

app.get('/feed/top3', async (req, res) => {
  const random = minMax(1, 10)
  try {
    const raw = fs.readFileSync(`./dump/cleared/page_${random}.json`)
    const parsed = JSON.parse(raw)
    res.send(parsed.slice(0, 3))
  } catch (error) {
    res.send({ message: "We're unable to load this page." })
  }
})

app.listen(PORT, () => {
  console.log(`API executando em http://localhost:${PORT}`)
})
