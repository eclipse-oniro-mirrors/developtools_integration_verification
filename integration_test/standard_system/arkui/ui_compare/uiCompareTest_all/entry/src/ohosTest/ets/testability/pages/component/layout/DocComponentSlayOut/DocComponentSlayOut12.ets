/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct DocComponentSlayOut12 {
  @State currentValue: number = 5;
  @State stepSize: number = 1;
  @State minValue: number = 0;
  @State maxValue: number = 10;

  build() {
    Column({ space: 20 }) {
      Text('自定义计数器示例')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30 })
      Counter()
        .width(200)
        .height(50)
        .id('DocComponentSlayOut12')
        .backgroundColor('#F0F0F0')
        .borderRadius(25)
        .onInc(() => {
          if (this.currentValue < this.maxValue) {
            this.currentValue += this.stepSize;
          }
        })
        .onDec(() => {
          if (this.currentValue > this.minValue) {
            this.currentValue -= this.stepSize;
          }
        })

      Column({ space: 10 }) {
        Text('自定义参数设置')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        Row({ space: 10 }) {
          Text('步长:')
            .width(60)
          Button('-')
            .onClick(() => {
              if (this.stepSize > 1) {
                this.stepSize--;
              }
            })
          Text(`${this.stepSize}`)
            .width(30)
            .textAlign(TextAlign.Center)
          Button('+')
            .onClick(() => {
              if (this.stepSize < 5) {
                this.stepSize++;
              }
            })
        }

        // 最小值控制
        Row({ space: 10 }) {
          Text('最小值:')
            .width(60)
          Button('-')
            .onClick(() => {
              if (this.minValue > 0) {
                this.minValue--;
              }
              if (this.currentValue < this.minValue) {
                this.currentValue = this.minValue;
              }
            })
          Text(`${this.minValue}`)
            .width(30)
            .textAlign(TextAlign.Center)
          Button('+')
            .onClick(() => {
              if (this.minValue < this.currentValue) {
                this.minValue++;
              }
            })
        }

        // 最大值控制
        Row({ space: 10 }) {
          Text('最大值:')
            .width(60)
          Button('-')
            .onClick(() => {
              if (this.maxValue > this.currentValue) {
                this.maxValue--;
              }
            })
          Text(`${this.maxValue}`)
            .width(30)
            .textAlign(TextAlign.Center)
          Button('+')
            .onClick(() => {
              if (this.maxValue < 100) {
                this.maxValue++;
              }
            })
        }
      }
      .width('80%')
      .padding(15)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .shadow({
        radius: 5,
        offsetX: 0,
        offsetY: 3,
        color: '#AAAAAA'
      })

      // 显示当前值
      Text(`当前数值: ${this.currentValue}`)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding(20)
  }
}
