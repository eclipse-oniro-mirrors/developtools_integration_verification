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
export struct ActionSr0080 {
  @Local parentWidth: number = 300;
  @Local parentHeight: number = 300;
  @Local position1Top: number = 0;
  @Local position1Left: number = 0;
  @Local position1Width: number = 80;
  @Local position1Height: number = 80;
  @Local testResult: string = '';

  aboutToAppear(): void {
    // 计算右下角position位置
    this.position1Top = this.parentHeight - this.position1Height;
    this.position1Left = this.parentWidth - this.position1Width;
  }

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_ACTION_ARKUI_SR20250106997626_0080')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：单手模式右下角position位置验证`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"验证position1位置"按钮\n2. 观察position1及其父组件的位置和宽高\n3. 验证位置计算是否正确`)
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

        // position1：右下角
        Column() {
          Text(`position1\n右下角`)
            .fontSize(12)
            .fontColor(Color.White)
            .textAlign(TextAlign.Center)
        }
        .id('position1')
        .width(this.position1Width)
        .height(this.position1Height)
        .backgroundColor(Color.Red)
        .position({ x: this.position1Left, y: this.position1Top })
      }
      .width(this.parentWidth)
      .height(this.parentHeight)
      .backgroundColor('#E0E0E0')
      .border({ width: 2, color: Color.Blue })

      Button(`验证position1位置`)
        .id('btn')
        .onClick(() => {
          const topResult = (this.position1Top + this.position1Height) === this.parentHeight;
          const leftResult = (this.position1Left + this.position1Width) === this.parentWidth;
          
          if (topResult && leftResult) {
            this.testResult = `✅ 验证通过：\nposition1.top(${this.position1Top}) + height(${this.position1Height}) = 父组件.height(${this.parentHeight})\nposition1.left(${this.position1Left}) + width(${this.position1Width}) = 父组件.width(${this.parentWidth})`;
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

      Text(`2.1. 右下角position1的top + height = 父组件的top + height\n2.2. 右下角position1的left + width = 父组件的left + width`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：此测试验证单手模式下position定位的准确性`)
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

