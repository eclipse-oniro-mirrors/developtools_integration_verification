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
 * 宽高动态改变，触发setSelection效果
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0013
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorSetselection0013 {
  controller: RichEditorController = new RichEditorController();
  @Local editorWidth: number = 300;
  @Local editorHeight: number = 200;

  aboutToAppear(): void {
    // 添加多行图文混合文本
    let text = '';
    for (let i = 0; i < 30; i++) {
      text += `第${i + 1}行：这是测试文本内容，用于测试setSelection功能。`;
    }
    this.controller.addTextSpan(text, {
      style: {
        fontSize: 14
      }
    });
  }

  executeSelection(): void {
    this.controller.setSelection(10, 100);
  }

  build() {
    Column() {
      Text('宽高动态改变，触发setSelection效果')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })

        .width(this.editorWidth)
        .height(this.editorHeight)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('执行setSelection(...)')
        .id('execSelectionBtn')
        .onClick(() => {
          this.executeSelection();
        })
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {
          // 测试按钮
        })

      Row() {
        Button('改变宽度')
          .id('changeWidthBtn')
          .onClick(() => {
            this.editorWidth = this.editorWidth === 300 ? 400 : 300;
          })
          .margin({ right: 10 })

        Button('改变高度')
          .onClick(() => {
            this.editorHeight = this.editorHeight === 200 ? 300 : 200;
          })
          .margin({ right: 10 })

        Button('重新选中')
          .id('reSelectBtn')
          .onClick(() => {
            this.controller.setSelection(10, 100);
          })
      }
      .margin({ top: 10 })


      Text('测试参数：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 5 })
        .alignSelf(ItemAlign.Start)

      Text('isForward: false, setSelection(10, 100)')
        .fontSize(10)
        .width('95%')
        .fontColor('#0066CC')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
