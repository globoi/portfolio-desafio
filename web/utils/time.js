/**
 * @function formatDuration
 * @description Formats the duration of the video
 * @param {number} duration
 * @returns {string}
 */
export function formatDuration(duration) {
  let minutes = Math.floor(duration / 60)
  let seconds = Math.floor(duration % 60)

  minutes = (minutes < 10 ? '0' : '') + minutes
  seconds = (seconds < 10 ? '0' : '') + seconds

  return minutes + ':' + seconds
}
