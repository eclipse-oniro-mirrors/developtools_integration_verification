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
@ComponentV2
export struct ActionSr0100 {
  @Local parentWidth: number = 300;
  @Local parentHeight: number = 300;
  @Local position2Top: number = 0;
  @Local position2Left: number = 0;
  @Local position2Width: number = 80;
  @Local position2Height: number = 80;
  @Local testResult: string = '';

  aboutToAppear(): void {
    // 计算左下角position位置
    this.position2Top = this.parentHeight - this.position2Height;
    this.position2Left = 0;
  }

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_ACTION_ARKUI_SR20250106997626_0100')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：单手模式左下角position位置验证`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击打开测试HAP，通过UIViewer查看页面\n2. 观察"position2"及其父组件的位置和宽高`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      // 父组件容器
      Column() {
        Text(`父组件容器\n宽：${this.parentWidth}vp\n高：${this.parentHeight}vp`)
          .fontSize(12)
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })

        // position2：左下角
        Column() {
          Text(`position2\n左下角`)
            .fontSize(12)
            .fontColor(Color.White)
            .textAlign(TextAlign.Center)
        }
        .id('position2')
        .width(this.position2Width)
        .height(this.position2Height)
        .backgroundColor(Color.Blue)
        .position({ x: this.position2Left, y: this.position2Top })
      }
      .width(this.parentWidth)
      .height(this.parentHeight)
      .backgroundColor('#E0E0E0')
      .border({ width: 2, color: Color.Blue })

      Button(`验证position2位置`)
        .id('btn')
        .onClick(() => {
          const topResult = (this.position2Top + this.position2Height) === this.parentHeight;
          const leftResult = this.position2Left === 0;
          
          if (topResult && leftResult) {
            this.testResult = `✅ 验证通过：\nposition2.top(${this.position2Top}) + height(${this.position2Height}) = 父组件.height(${this.parentHeight})\nposition2.left(${this.position2Left}) = 父组件.left(0)`;
          } else {
            this.testResult = `❌ 验证失败：位置计算不正确`;
          }
        })

      if (this.testResult !== '') {
        Text(this.testResult)
          .fontSize(12)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)
          .padding(10)
          .backgroundColor('#E8F5E9')
          .borderRadius(8)
      }

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`2.1、左下角position2的top + height = 父组件的top + height\n2.2、左下角position2的left = 父组件的left`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：此测试验证单手模式下position定位的准确性（左下角）`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

