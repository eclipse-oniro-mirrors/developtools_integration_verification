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
 * 在onCopy回调内使用updateSpanStyle
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0087
 */
@Entry
@ComponentV2
export struct RicheditorInterface0087 {
  controller: RichEditorController = new RichEditorController();
  @Local logText: string = '';

  build() {
    Scroll() {
      Column() {
        Text('onCopy回调内updateSpanStyle测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0087')
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
          .onCopy(() => {
            this.logText = 'onCopy触发，更新文本样式';
            // 在onCopy回调内更新样式
            this.controller.updateSpanStyle({
              start: 0,
              end: 10,
              textStyle: {
                fontColor: Color.Blue,
                fontSize: 16
              }
            });
          })

        Button('选中文本后复制')
          .fontSize(12)
          .onClick(() => {
            this.controller.setSelection(5, 15);
            this.logText = '已选中文本，请按Ctrl+C复制';
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

        Text('1. 在onCopy回调内调用updateSpanStyle\\n2. 进行文本复制，触发onCopy回调')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('执行updateSpanStyle，指定范围内的样式被更新')
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
    this.controller.addTextSpan('这是一段图文混合测试内容，用于测试onCopy回调中的updateSpanStyle功能。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

