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
 * BarState设置为Auto，改变组件宽度及高度，观察滚动条
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ gundongtiao_0007
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorGundongtiao0007 {
  controller: RichEditorController = new RichEditorController();
  @Local editorWidth: number = 300;
  @Local editorHeight: number = 200;

  aboutToAppear(): void {
    // 添加大量图文混排内容
    for (let i = 0; i < 20; i++) {
      this.controller.addTextSpan(`第${i + 1}行文本内容：这是一段测试文本，用于测试滚动条的显示效果。`, {
        style: {
          fontSize: 14
        }
      });
      this.controller.addTextSpan('\n');
    }
  }

  build() {
    Column() {
      Text('BarState设置为Auto，改变组件宽度及高度，观察滚动条')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })

        .width(this.editorWidth)
        .height(this.editorHeight)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {
          // 测试按钮
        })

      Row() {
        Button('宽度+50')
          .id('widthPlusBtn')
          .onClick(() => {
            this.editorWidth += 50;
          })
          .margin({ right: 5 })

        Button('宽度-50')
          .onClick(() => {
            if (this.editorWidth > 100) {
              this.editorWidth -= 50;
            }
          })
          .margin({ right: 5 })

        Button('高度+50')
          .id('heightPlusBtn')
          .onClick(() => {
            this.editorHeight += 50;
          })
          .margin({ right: 5 })

        Button('高度-50')
          .onClick(() => {
            if (this.editorHeight > 100) {
              this.editorHeight -= 50;
            }
          })
      }
      .margin({ top: 10 })


      Text('测试步骤：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 5 })
        .alignSelf(ItemAlign.Start)

      Text('1、组件内添加图文混排内容\n2、BarState设置Auto\n3、改变组件宽度及高度，观察滚动条')
        .fontSize(10)
        .width('95%')

      Text('预期结果：尺寸变化时一直显示滚动条，停止变化2s后自动消失')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
