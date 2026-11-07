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
@Component
struct UiComponentTextTextRichtext0080 {
  @State indentValue: number = 50;

  build() {
    Column() {
      // 页面描述
      Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0080')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
      Text('测试名称：Text组件的缩进(纯文本)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // 单行中文，缩进量50
      Text('单行中文文本内容测试')
        .width(300)
        .fontSize(16)
        .textIndent(50)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_chinese_0080')

      // 两行中文，缩进量50
      Text('两行中文文本内容测试，这是第一行内容\n这是第二行内容')
        .width(300)
        .fontSize(16)
        .textIndent(50)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_multi_chinese_0080')

      // 单行中英文混合，缩进量50
      Text('Single line mixed text 中英文混合')
        .width(300)
        .fontSize(16)
        .textIndent(50)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_mixed_0080')

      // 两行中英文混合，缩进量50
      Text('Mixed text 中英文混合第一行\nSecond line 第二行内容')
        .width(300)
        .fontSize(16)
        .textIndent(50)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_multi_mixed_0080')

      // 动态缩进测试
      Text('动态缩进测试文本内容')
        .width(300)
        .fontSize(16)
        .textIndent(this.indentValue)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_dynamic_indent_0080')

      Button('设置缩进为0')
        .onClick(() => {
          this.indentValue = 0;
        })
        .margin(10)
        .id('button_indent_zero_0080')

      Button('设置缩进为-10')
        .onClick(() => {
          this.indentValue = -10;
        })
        .margin(10)
        .id('button_indent_negative_0080')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

