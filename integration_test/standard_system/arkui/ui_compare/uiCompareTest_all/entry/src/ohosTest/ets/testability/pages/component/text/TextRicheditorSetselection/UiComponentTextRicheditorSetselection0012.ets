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
 * 设置isForward为true，选中显示范围外的文本内容
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0012
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorSetselection0012 {
  controller: RichEditorController = new RichEditorController();

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
    this.controller.setSelection(150, 200);
  }

  build() {
    Column() {
      Text('设置isForward为true，选中显示范围外的文本内容')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })

        .width('95%')
        .height(200)
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


      Text('测试参数：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 5 })
        .alignSelf(ItemAlign.Start)

      Text('isForward: true, setSelection(150, 200)')
        .fontSize(10)
        .width('95%')
        .fontColor('#0066CC')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
