/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ScrollByExample3 {
  private scrollController: Scroller = new Scroller()
  @State dxValue: string = '0'
  @State dyValue: string = '0'
  @State currentX: number = 0
  @State currentY: number = 0

  build() {
    Column() {
      // 控制面板
      Row({ space: 10 }) {
        TextInput({ placeholder: 'dx' })
          .width(100)
          .onChange((value: string) => this.dxValue = value)

        TextInput({ placeholder: 'dy' })
          .width(100)
          .onChange((value: string) => this.dyValue = value)

        Button('执行滚动')
          .onClick(() => this.handleScroll())
      }
      .padding(10)

      // 当前滚动位置显示
      Text(`当前位置: X=${this.currentX}px, Y=${this.currentY}px`)
        .fontColor(Color.Blue)

      // 滚动内容容器
      Scroll(this.scrollController) {
        Column() {
          ForEach(
            Array.from({ length: 50 }) as number[], // 明确数组类型
            (item: undefined, index: number) => {
              // item类型根据实际情况调整
              Text(`Item ${index + 1}`)
              .width('90%')
              .height(100)
              .backgroundColor(index % 2 ? '#F5F5F5' : '#FFFFFF')
              .margin(5)
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('70%')
      .onScroll((xOffset: number, yOffset: number) => {
        this.currentX = Math.round(xOffset)
        this.currentY = Math.round(yOffset)
      })
    }
    .padding(15)
  }

  private handleScroll(): void {
    try {
      const dx = this.parseLength(this.dxValue)
      const dy = this.parseLength(this.dyValue)

      this.scrollController.scrollBy(dx, dy)
    } catch (error) {
      console.error('滚动参数错误:', error)
    }
  }

  private parseLength(value: string): number {
    const unitRegex = /([+-]?\d+)(vp|px)?/
    const match = value.match(unitRegex)

    if (!match) {
      throw new Error('无效格式')
    }

    const numericValue = parseFloat(match[1])
    const unit = match[2] || 'vp'

    // 单位转换（实际项目需考虑设备DPI）
    return unit === 'vp' ? numericValue : numericValue
  }
}
