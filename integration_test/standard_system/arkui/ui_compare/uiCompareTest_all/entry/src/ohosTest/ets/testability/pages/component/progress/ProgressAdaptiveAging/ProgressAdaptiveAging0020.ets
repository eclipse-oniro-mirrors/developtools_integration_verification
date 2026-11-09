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
struct ProgressAdaptiveAging0020 {
  @State progressValue: number = 50
  @State progressType: ProgressType = ProgressType.Linear
  @State progressHeight: number = 50
  @State fontScale: number = 1.0
  @State baseFontSize: number = 16
  @State baseProgressHeight: number = 50

  build() {
    Column({ space: 20 }) {
      Text('Progress自适应老化测试')
        .fontSize(24 * this.fontScale)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // Progress组件
      Progress({
        value: this.progressValue,
        total: 100,
        type: this.progressType
      })
        .width('80%')
        .height(this.baseProgressHeight * this.fontScale)
        .id('progress_adaptive_aging_0020')

      // 控制按钮区域
      Column({ space: 15 }) {
        Button('ArkUIHDS_Progress_Elder_0200')
          .width('80%')
          .fontSize(this.baseFontSize * this.fontScale)
          .id('ProgressAdaptiveAging0020_001')
          .onClick(() => {
            // 初始化设置
            this.progressValue = 50
            this.progressType = ProgressType.Linear
            this.progressHeight = 50
            this.fontScale = 1.0
          })

        Row({ space: 10 }) {
          Button('1.75')
            .width('20%')
            .fontSize(this.baseFontSize * this.fontScale)
            .id('ProgressAdaptiveAging0020_002')
            .onClick(() => {
              // 设置字体大小为1.75倍
              this.fontScale = 1.75
            })

          Button('2')
            .width('20%')
            .fontSize(this.baseFontSize * this.fontScale)
            .id('ProgressAdaptiveAging0020_003')
            .onClick(() => {
              // 设置字体大小为2倍
              this.fontScale = 2.0
            })

          Button('3.2')
            .width('20%')
            .fontSize(this.baseFontSize * this.fontScale)
            .id('ProgressAdaptiveAging0020_004')
            .onClick(() => {
              // 设置字体大小为3.2倍
              this.fontScale = 3.2
            })
        }
        .width('80%')
        .justifyContent(FlexAlign.SpaceEvenly)

        Button('Capsule')
          .width('80%')
          .fontSize(this.baseFontSize * this.fontScale)
          .id('ProgressAdaptiveAging0020_005')
          .onClick(() => {
            // 切换到胶囊样式
            this.progressType = ProgressType.Capsule
          })

        Text(`当前样式: ${this.progressType === ProgressType.Linear ? '线性' : '胶囊'}`)
          .fontSize(this.baseFontSize * this.fontScale)
          .margin({ top: 10 })

        Text(`当前字体缩放: ${this.fontScale}倍`)
          .fontSize(this.baseFontSize * this.fontScale)

        Text(`Progress高度: ${Math.round(this.baseProgressHeight * this.fontScale)}`)
          .fontSize(this.baseFontSize * this.fontScale)

        Text(`当前进度: ${this.progressValue}%`)
          .fontSize(this.baseFontSize * this.fontScale)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}


