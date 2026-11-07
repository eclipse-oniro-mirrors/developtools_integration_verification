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
struct PositionExample {
  @State topVal: string = '0'
  @State bottomVal: string = '0'
  @State leftVal: string = '0'
  @State rightVal: string = '0'

  // 测试值队列
  private testValues = [
    '50px', '60vp', '70fp', '80lpx',
    '60%', "$r('app.string.string_value_100')", '100abc', '-50'
  ]
  @State testIndex: number = 0

  // 有效性校验正则
  private isValid(value: string): boolean {
    if (value.startsWith('$r')) {
      return true // 假设资源引用有效
    }
    const regex = /^-?\d+(\.\d+)?(px|vp|fp|lpx|%)?$/
    return regex.test(value)
  }

  // 动态计算position
  private getPosition(): Edges | Position{
    return {
      top: this.getValidValue(this.topVal, this.bottomVal),
      bottom: this.getValidValue(this.bottomVal, this.topVal),
      left: this.getValidValue(this.leftVal, this.rightVal),
      right: this.getValidValue(this.rightVal, this.leftVal)
    }
  }

  private getValidValue(primary: string, secondary: string): Dimension {
    if (this.isValid(primary)) {
      return this.formatValue(primary)
    }
    if (this.isValid(secondary)) {
      return this.formatValue(secondary)
    }
    return 0 // 双无效回退0
  }

  private formatValue(value: string | Dimension): Dimension {
    if ((value as string).includes('%') || (value as string).endsWith('px') ||
    (value as string).endsWith('vp') || (value as string).endsWith('fp') ||
    (value as string).endsWith('lpx')) {
      return value as Dimension
    }
    return parseFloat(value as string) // 处理纯数字
  }

  build() {
    Column() {
      // 控制按钮
      Row({ space: 5 }) {
        Button('Toggle Top')
          .id('Toggle Top')
          .onClick(() => {
            this.topVal = this.testValues[this.testIndex % this.testValues.length]
            this.testIndex++
          })

        Button('Toggle Bottom')
          .id('Toggle Bottom')
          .onClick(() => {
            this.bottomVal = this.testValues[this.testIndex % this.testValues.length]
            this.testIndex++
          })

        Button('Toggle Left')
          .id('Toggle Left')
          .onClick(() => {
            this.leftVal = this.testValues[this.testIndex % this.testValues.length]
            this.testIndex++
          })

        Button('Toggle Right')
          .id('Toggle Right')
          .onClick(() => {
            this.rightVal = this.testValues[this.testIndex % this.testValues.length]
            this.testIndex++
          })
      }

      // 定位容器
      Column() {
        Text('Dynamic Position')
          .size({ width: 100, height: 100 })
          .backgroundColor(Color.Blue)
          .offset(this.getPosition())
      }
      .size({ width: 500, height: 500 })
      .backgroundColor('#f0f0f0')
      .margin(40)
    }
    .width('100%')
    .padding(20)
  }
}

export {}
