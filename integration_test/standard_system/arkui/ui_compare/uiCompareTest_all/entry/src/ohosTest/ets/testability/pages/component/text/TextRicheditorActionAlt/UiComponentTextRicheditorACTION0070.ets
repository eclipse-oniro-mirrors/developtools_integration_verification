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
 * fontSize异常值处理
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0070
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorACTION0070 {
  controller: RichEditorController = new RichEditorController();
  @Local testResult: string = '等待测试';

  setFontSizePercent(): void {
    // 测试：设置fontSize为异常值（负数）
    try {
      this.controller.setTypingStyle({
        fontSize: -10  // 异常值：负数
      });
      this.testResult = '✅ 设置完成，检查是否为默认值16fp';
    } catch (e) {
      this.testResult = '⚠️ 设置异常: ' + e.message;
    }
  }

  build() {
    Column() {
      Text('fontSize异常值处理')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })
        .width('95%')
        .height(150)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('设置fontSize为百分比')
        .id('setFontSizeBtn')
        .onClick(() => {
          this.setFontSizePercent();
        })
        .margin({ bottom: 10 })

      Text(`测试结果: ${this.testResult}`)
        .fontSize(12)
        .fontColor('#0066CC')
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {})

      Text('预期结果：字体大小为默认值16，单位为fp')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
