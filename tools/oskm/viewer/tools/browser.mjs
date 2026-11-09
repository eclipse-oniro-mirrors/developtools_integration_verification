import { chromium } from 'playwright'

export const BASE_URL = process.env.BASE_URL || 'http://localhost:5173'

/** 优先用 Playwright 自带浏览器；本机没有下载时退回系统 Chrome。 */
export const launchBrowser = () => chromium.launch()
  .catch(error => error.message.includes('Executable doesn\'t exist')
    ? chromium.launch({ channel: 'chrome' })
    : Promise.reject(error))
