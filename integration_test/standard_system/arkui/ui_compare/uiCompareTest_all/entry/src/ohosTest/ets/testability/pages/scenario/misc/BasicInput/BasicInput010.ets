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

/**
 * 测试用例：Ace_JSDeclarativeParadigm_Component_Basic_Input_010
 * 测试目的：测试长文本框光标颜色
 * 预期结果：光标颜色可以正确设置和显示
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct BasicInput010 {
  @Local textValue: string = '这是一段超长文本内容，用于测试光标颜色在长文本中的显示效果。请点击输入框查看光标颜色。';
  @Local cursorColor: Color = Color.Red;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 15 }) {
      Text('Ace_JSDeclarativeParadigm_Component_Basic_Input_010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text('测试：长文本框光标颜色')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 当前光标颜色显示
      Row({ space: 10 }) {
        Text('当前光标颜色：')
          .fontSize(14)
        Circle()
          .width(20)
          .height(20)
          .fill(this.cursorColor)
      }

      // 长文本输入框
      Column({ space: 8 }) {
        Text('长文本输入框（点击查看光标）：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        TextInput({ text: this.textValue })
          .id('longTextInput')
          .width('100%')
          .height(80)
          .maxLength(500)
          .caretColor(this.cursorColor)
          .fontSize(14)
          .borderRadius(8)
          .borderWidth(1)
          .borderColor('#007AFF')
          .onChange((value: string) => {
            this.textValue = value;
            hilog.info(0x0000, 'testTag', `Text changed: ${value.length} chars`);
          })
      }
      .width('100%')

      Divider()

      // 光标颜色选择
      Column({ space: 10 }) {
        Text('选择光标颜色：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Row({ space: 10 }) {
          Button('红色')
            .id('redBtn')
            .backgroundColor(Color.Red)
            .onClick(() => {
              this.cursorColor = Color.Red;
              this.testStatus = '光标颜色已设置为红色';
              hilog.info(0x0000, 'testTag', 'Cursor color set to Red');
            })

          Button('蓝色')
            .id('blueBtn')
            .backgroundColor(Color.Blue)
            .onClick(() => {
              this.cursorColor = Color.Blue;
              this.testStatus = '光标颜色已设置为蓝色';
              hilog.info(0x0000, 'testTag', 'Cursor color set to Blue');
            })

          Button('绿色')
            .id('greenBtn')
            .backgroundColor(Color.Green)
            .onClick(() => {
              this.cursorColor = Color.Green;
              this.testStatus = '光标颜色已设置为绿色';
              hilog.info(0x0000, 'testTag', 'Cursor color set to Green');
            })

          Button('橙色')
            .id('orangeBtn')
            .backgroundColor(Color.Orange)
            .onClick(() => {
              this.cursorColor = Color.Orange;
              this.testStatus = '光标颜色已设置为橙色';
              hilog.info(0x0000, 'testTag', 'Cursor color set to Orange');
            })
        }
      }
      .width('100%')

      Divider()

      // 测试说明
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 点击上方输入框，观察光标颜色')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 点击不同颜色按钮切换光标颜色')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 再次点击输入框确认光标颜色已改变')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      // 预期结果
      Text('预期结果：光标颜色可以正确设置和显示')
        .fontSize(13)
        .fontColor(Color.Green)
        .padding(8)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

