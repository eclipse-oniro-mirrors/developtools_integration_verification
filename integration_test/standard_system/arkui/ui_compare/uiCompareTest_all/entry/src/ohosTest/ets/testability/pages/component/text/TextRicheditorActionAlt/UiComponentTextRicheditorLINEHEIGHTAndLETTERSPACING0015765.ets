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
 * 组件设置letterspacing为负值，输入内容后再删除
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT&LETTERSPACING_0015_765
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorLINEHEIGHTAndLETTERSPACING0015765 {
  controller: RichEditorController = new RichEditorController();
  @Local testText: string = '';

  addTextContent(): void {
    this.testText = '测试letterspacing负值的文本内容';
    this.controller.addTextSpan(this.testText, {
      style: {
        fontSize: 16,
        fontFeature: 'ss01'
      }
    });
  }

  deleteContent(): void {
    // 删除所有内容
    const length = this.controller.getSpans().length;
    if (length > 0) {
      this.controller.deleteSpans({ start: 0, end: -1 });
      this.testText = '已删除';
    }
  }

  build() {
    Column() {
      Text('letterspacing负值测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })
        .width('95%')
        .height(150)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Row() {
        Button('添加文本')
          .id('addTextBtn')
          .onClick(() => {
            this.addTextContent();
          })
          .margin({ right: 5 })

        Button('删除内容')
          .id('deleteBtn')
          .onClick(() => {
            this.deleteContent();
          })
          .margin({ right: 5 })

        Button('测试完成')
          .id('btn')
          .onClick(() => {})
      }

      Text(`状态: ${this.testText || '未添加内容'}`)
        .fontSize(12)
        .margin({ top: 10 })

      Text('预期结果：已输入内容能被正常删除')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
