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
struct DialogSpecificationsUi0120 {
  @State count1: number = 0;
  @State count2: number = 0;
  @State clipEnabled1: boolean = true;
  @State clipEnabled2: boolean = true;

  build() {
    Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
      Column() {
        // 第一个按钮：宽较小的情况
        Row() {
          Column() {
            Text('Circle+容器+宽较小')
              .fontSize(9)
              .fontColor(0xCCCCCC)
            Text(`点击次数: ${this.count1}`)
              .fontSize(9)
              .fontColor(0xCCCCCC)
            Text(`clip: ${this.clipEnabled1}`)
              .fontSize(9)
              .fontColor(this.clipEnabled1 ? 0xFF0000 : 0x00FF00)
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ right: 10 })

          Button({ type: ButtonType.Circle, stateEffect: true }) {
            LoadingProgress()
              .width(100)
              .height(100)
              .color(0xFFFFFF)
          }
          .width(60)
          .height(60)
          .backgroundColor(0x317aff)
          .id('DialogSpecificationsUi0120_001')
          .clip(this.clipEnabled1)
          .onClick(() => {
            this.count1++;
            this.clipEnabled1 = !this.clipEnabled1;
          })
        }
        .width('100%')
        .padding(10)
        .margin({ top: 20 })

        // 第二个按钮：高较小的情况
        Row() {
          Column() {
            Text('Circle+容器+高较小')
              .fontSize(9)
              .fontColor(0xCCCCCC)
            Text(`点击次数: ${this.count2}`)
              .fontSize(9)
              .fontColor(0xCCCCCC)
            Text(`clip: ${this.clipEnabled2}`)
              .fontSize(9)
              .fontColor(this.clipEnabled2 ? 0xFF0000 : 0x00FF00)
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ right: 10 })

          Button({ type: ButtonType.Circle, stateEffect: true }) {
            LoadingProgress()
              .width(100)
              .height(100)
              .color(0xFFFFFF)
          }
          .width(60)
          .height(60)
          .backgroundColor(0xF55A42)
          .id('DialogSpecificationsUi0120_002')
          .clip(this.clipEnabled2)
          .onClick(() => {
            this.count2++;
            this.clipEnabled2 = !this.clipEnabled2;
          })
        }
        .width('100%')
        .padding(10)
        .margin({ top: 20 })

        // 说明文字
        Text('点击按钮切换clip属性，观察图标是否超出显示')
          .fontSize(12)
          .fontColor(0x999999)
          .margin({ top: 30 })
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(20)
    }
  }
}


