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
 * 在onPaste回调内使用updateSpanStyle
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0088
 */
@Entry
@ComponentV2
export struct RicheditorInterface0088 {
  controller: RichEditorController = new RichEditorController();
  @Local logText: string = '';

  build() {
    Scroll() {
      Column() {
        Text('onPaste回调内updateSpanStyle测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0088')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text(`日志: ${this.logText}`)
          .fontSize(12)
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(200)
          .border({ width: 1, color: '#ccc' })
          .margin({ bottom: 15 })
          .onPaste(() => {
            this.logText = 'onPaste触发，更新原有文本样式（不包括粘贴内容）';
            // 在onPaste回调内更新样式（不包括此次粘贴的内容）
            this.controller.updateSpanStyle({
              start: 0,
              end: 10,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 16
              }
            });
          })

        Button('点击后粘贴内容')
          .fontSize(12)
          .onClick(() => {
            this.controller.setSelection(10, 10);
            this.logText = '光标已定位，请按Ctrl+V粘贴';
          })
          .margin({ bottom: 15 })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {})
          .margin({ bottom: 15 })

        Text('测试说明：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('1. 在onPaste回调内调用updateSpanStyle\\n2. 拖拽/粘贴内容到RichEditor\\n3. 观察样式更新效果')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('执行updateSpanStyle，指定范围内（不包括此次粘贴）的样式被更新')
          .fontSize(10)
          .fontColor('#FF6B35')
          .width('95%')
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('这是一段图文混合测试内容，用于测试onPaste回调中的updateSpanStyle功能。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

