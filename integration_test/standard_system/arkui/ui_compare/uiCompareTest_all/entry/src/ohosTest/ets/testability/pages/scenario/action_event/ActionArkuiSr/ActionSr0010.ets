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
export struct ActionSr0010 {
  @Local text1ZIndex: number = 0;
  @Local text2ZIndex: number = 0;
  @Local clickedText: string = '';
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_ACTION_ARKUI_SR20250106997626_0010')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：正常模式下改变Z序`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击中间的Text1区域\n2. 点击"change Text2 zIndex"按钮\n3. 再次点击中间的Text1区域`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 10 }) {
        Text(`Text2 now zIndex: ${this.text2ZIndex}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`最后点击的Text：${this.clickedText}`)
          .fontSize(14)
          .fontColor(Color.Orange)

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Green)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      // 测试区域：两个重叠的Text
      Stack() {
        Text('Text1\nBackground')
          .id('text1')
          .fontSize(20)
          .width(200)
          .height(100)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Pink)
          .zIndex(this.text1ZIndex)
          .onClick(() => {
            this.clickedText = 'Text1';
            this.testStatus = '✅ 点击到Text1';
          })

        Text('Text2\nForeground')
          .id('text2')
          .fontSize(20)
          .width(180)
          .height(80)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Yellow)
          .zIndex(this.text2ZIndex)
          .onClick(() => {
            this.clickedText = 'Text2';
            this.testStatus = '✅ 点击到Text2';
          })
      }
      .width('100%')
      .height('12.3%')
      .margin({ top: 10 })

      Button(`change Text2 zIndex`)
        .id('btn')
        .onClick(() => {
          this.text2ZIndex = 1;
          this.testStatus = 'Text2 zIndex已改为1（位于Text1之上）';
        })

      Button(`重置`)
        .onClick(() => {
          this.text1ZIndex = 0;
          this.text2ZIndex = 0;
          this.clickedText = '';
          this.testStatus = '待测试';
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`步骤2：日志输出Text1 Onclick！\n步骤4：Text2 zIndex从0变为1\n步骤5：日志输出Text2 Onclick！（zIndex改变后Text2在上层）`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

