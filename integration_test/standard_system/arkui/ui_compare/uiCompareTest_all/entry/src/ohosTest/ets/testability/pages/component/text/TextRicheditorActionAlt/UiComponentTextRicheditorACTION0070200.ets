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
 * 默认样式文本中插入预设样式文本
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070_200
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorACTION0070200 {
  controller: RichEditorController = new RichEditorController();

  aboutToAppear(): void {
    // 添加默认样式文本A
    this.controller.addTextSpan('默认样式文本A，', {
      style: { fontSize: 16 }
    });
    this.controller.addTextSpan('这是文本A的后半部分。', {
      style: { fontSize: 16 }
    });
  }

  setPresetStyle(): void {
    // 设置预设样式
    this.controller.setTypingStyle({
      fontSize: 20,
      fontColor: Color.Red,
      fontWeight: FontWeight.Bold
    });
  }

  insertTextB(): void {
    // 模拟插入带换行符的文本B到文本A中间
    this.controller.addTextSpan('\n【预设样式文本B】\n', {
      style: {
        fontSize: 20,
        fontColor: Color.Red,
        fontWeight: FontWeight.Bold
      }
    });
  }

  build() {
    Column() {
      Text('默认样式文本中插入预设样式文本')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })
        .width('95%')
        .height(200)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Row() {
        Button('设置预设样式')
          .id('setStyleBtn')
          .onClick(() => {
            this.setPresetStyle();
          })
          .margin({ right: 5 })

        Button('插入文本B')
          .id('insertTextBtn')
          .onClick(() => {
            this.insertTextB();
          })
          .margin({ right: 5 })

        Button('测试完成')
          .id('btn')
          .onClick(() => {})
      }

      Text('预期结果：文本B预设样式跟随预设样式（红色、加粗、20fp）')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
