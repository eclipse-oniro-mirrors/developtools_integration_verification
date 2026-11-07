/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


@Entry
@Component
struct PreviewBasic0320 {
  @State selectedDate: Date = new Date()
  @State currentMonth: number = new Date().getMonth()
  @State currentYear: number = new Date().getFullYear()

  // Calendar 样式配置（参考官方文档）
  private calendarDayColor: string = '#333333'        // 日历日期颜色
  private calendarWeekColor: string = '#666666'       // 日历星期颜色
  private calendarOffColor: string = '#CCCCCC'        // 非本月日期颜色
  private calendarTodayColor: string = '#007DFF'      // 今日标记颜色
  private calendarLunarColor: string = '#999999'      // 农历文字颜色
  private calendarWorkdayColor: string = '#FF4500'    // 工作日标记颜色
  private calendarHolidayColor: string = '#FF0000'    // 节假日标记颜色
  private calendarDayFontSize: string = '56px'        // 日期字体大小（2倍：28px -> 56px）
  private calendarLunarFontSize: string = '32px'      // 农历字体大小（2倍：16px -> 32px）
  private calendarWeekFontSize: string = '40px'       // 星期字体大小（2倍：20px -> 40px）
  private calendarDayHeight: string = '150px'         // 日历日期高度（2倍：75px -> 150px）
  private calendarWeekHeight: string = '100px'        // 日历星期高度（2倍：50px -> 100px）
  private calendarDayWidth: string = '14.28%'         // 日历日期宽度

  // 获取当月天数
  getDaysInMonth(year: number, month: number): number {
    return new Date(year, month + 1, 0).getDate()
  }

  // 获取当月第一天是星期几
  getFirstDayOfMonth(year: number, month: number): number {
    return new Date(year, month, 1).getDay()
  }

  // 月份名称
  getMonthName(month: number): string {
    const months = ['一月', '二月', '三月', '四月', '五月', '六月',
      '七月', '八月', '九月', '十月', '十一月', '十二月']
    return months[month]
  }

  // 上个月
  previousMonth() {
    if (this.currentMonth === 0) {
      this.currentMonth = 11
      this.currentYear--
    } else {
      this.currentMonth--
    }
  }

  // 下个月
  nextMonth() {
    if (this.currentMonth === 11) {
      this.currentMonth = 0
      this.currentYear++
    } else {
      this.currentMonth++
    }
  }

  // 判断是否是今天
  isToday(day: number): boolean {
    const today = new Date()
    return day === today.getDate() &&
      this.currentMonth === today.getMonth() &&
      this.currentYear === today.getFullYear()
  }

  // 判断是否是选中日期
  isSelected(day: number): boolean {
    return day === this.selectedDate.getDate() &&
      this.currentMonth === this.selectedDate.getMonth() &&
      this.currentYear === this.selectedDate.getFullYear()
  }

  // 获取日期颜色（应用 calendarDayColor, calendarHolidayColor）
  getDayColor(day: number, weekIndex: number): string {
    if (this.isToday(day)) {
      return '#FFFFFF'
    }
    if (this.isSelected(day)) {
      return this.calendarTodayColor
    }
    // 周末使用节假日颜色
    if (weekIndex === 0 || weekIndex === 6) {
      return this.calendarHolidayColor
    }
    return this.calendarDayColor
  }

  // 获取日期背景色
  getDayBackground(day: number): string | Color {
    if (this.isToday(day)) {
      return this.calendarTodayColor
    }
    if (this.isSelected(day)) {
      return '#E6F2FF'
    }
    return Color.Transparent
  }

  // 获取农历日期文本（简化版）
  getLunarDay(day: number): string {
    const lunarDays = ['初一', '初二', '初三', '初四', '初五', '初六', '初七', '初八', '初九', '初十',
      '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十',
      '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十']

    // 简化处理：使用公历日期对应显示（实际应该计算真实农历）
    const lunarDay = (day + 10) % 30
    return lunarDays[lunarDay]
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('日历')
          .fontSize(56)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
      }
      .width('100%')
      .height('11.48%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')

      // 月份切换栏
      Row() {
        Button('<')
          .width(50)
          .height(50)
          .fontSize(26)
          .fontColor('#007DFF')
          .backgroundColor(Color.Transparent)
          .onClick(() => this.previousMonth())

        Text(`${this.currentYear}年 ${this.getMonthName(this.currentMonth)}`)
          .fontSize(22)
          .fontWeight(FontWeight.Medium)
          .fontColor('#333333')

        Button('>')
          .width(50)
          .height(50)
          .fontSize(26)
          .fontColor('#007DFF')
          .backgroundColor(Color.Transparent)
          .onClick(() => this.nextMonth())
      }
      .width('100%')
      .height('5.74%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#F5F5F5')

      // 星期标题（应用 calendarWeekColor 和 calendarWeekFontSize）
      Row() {
        ForEach(['日', '一', '二', '三', '四', '五', '六'], (day: string, index: number) => {
          Text(day)
            .width(this.calendarDayWidth)
            .height(this.calendarWeekHeight)
            .fontSize(this.calendarWeekFontSize)
            .fontColor(index === 0 || index === 6 ? this.calendarHolidayColor : this.calendarWeekColor)
            .fontWeight(FontWeight.Medium)
            .textAlign(TextAlign.Center)
        })
      }
      .width('100%')
      .backgroundColor('#FAFAFA')

      // 日期网格（应用各种 Calendar 属性）
      Column() {
        ForEach(this.getCalendarRows(), (week: number[]) => {
          Row({ space: 2 }) {
            ForEach(week, (day: number, index: number) => {
              if (day > 0) {
                Column({ space: 3 }) {
                  // 公历日期
                  Text(day.toString())
                    .fontSize(this.calendarDayFontSize)
                    .fontColor(this.getDayColor(day, index))
                    .fontWeight(this.isToday(day) ? FontWeight.Bold : FontWeight.Normal)

                  // 农历日期显示位置
                  Text(this.getLunarDay(day))
                    .fontSize(this.calendarLunarFontSize)
                    .fontColor(this.isToday(day) ? '#FFFFFF' : this.calendarLunarColor)
                    .maxLines(1)
                }
                .width(this.calendarDayWidth)
                .height(this.calendarDayHeight)
                .justifyContent(FlexAlign.Center)
                .backgroundColor(this.getDayBackground(day))
                .borderRadius(8)
                .border(this.isToday(day) ? { width: 2, color: this.calendarTodayColor } : undefined)
                .onClick(() => {
                  this.selectedDate = new Date(this.currentYear, this.currentMonth, day)
                })
              } else {
                Column()
                  .width(this.calendarDayWidth)
                  .height(this.calendarDayHeight)
              }
            })
          }
          .width('100%')
        })
      }
      .width('100%')
      .padding(5)
      .layoutWeight(1)

      // 底部信息栏
      Row() {
        Text(`选中日期: ${this.selectedDate.getFullYear()}-${this.selectedDate.getMonth() + 1}-${this.selectedDate.getDate()}`)
          .fontSize(22)
          .fontColor('#666666')
      }
      .width('100%')
      .height('5.74%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F5F5F5')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }

  // 生成日历行数据
  getCalendarRows(): number[][] {
    const daysInMonth = this.getDaysInMonth(this.currentYear, this.currentMonth)
    const firstDay = this.getFirstDayOfMonth(this.currentYear, this.currentMonth)

    const rows: number[][] = []
    let currentRow: number[] = []

    // 填充第一行的空白
    for (let i = 0; i < firstDay; i++) {
      currentRow.push(0)
    }

    // 填充日期
    for (let day = 1; day <= daysInMonth; day++) {
      currentRow.push(day)
      if (currentRow.length === 7) {
        rows.push(currentRow)
        currentRow = []
      }
    }

    // 填充最后一行的空白
    if (currentRow.length > 0) {
      while (currentRow.length < 7) {
        currentRow.push(0)
      }
      rows.push(currentRow)
    }

    return rows
  }
}

