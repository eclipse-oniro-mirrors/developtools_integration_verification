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
struct UiComponentTextTextRichtext0050 {
  build() {
    Scroll() {
      Column() {
        // 页面描述
        Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0050')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        Text('测试名称：Text的子组件类型纯文本时的水平对齐')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        // 单行文本，水平对齐方式未设定
        Text('单行文本未设定对齐')
          .width(300)
          .fontSize(16)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_single_default_0050')

        // 单行文本，水平对齐方式Center
        Text('单行文本Center对齐')
          .width(300)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_single_center_0050')

        // 单行文本，水平对齐方式Start
        Text('单行文本Start对齐')
          .width(300)
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_single_start_0050')

        // 单行文本，水平对齐方式End
        Text('单行文本End对齐')
          .width(300)
          .fontSize(16)
          .textAlign(TextAlign.End)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_single_end_0050')

        // 三行文本，水平对齐方式未设定
        Text('三行文本未设定对齐\n第二行文本内容\n第三行文本内容')
          .width(300)
          .fontSize(16)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_multi_default_0050')

        // 三行文本，水平对齐方式Center
        Text('三行文本Center对齐\n第二行文本内容\n第三行文本内容')
          .width(300)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_multi_center_0050')

        // 三行文本，水平对齐方式Start
        Text('三行文本Start对齐\n第二行文本内容\n第三行文本内容')
          .width(300)
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_multi_start_0050')

        // 三行文本，水平对齐方式End
        Text('三行文本End对齐\n第二行文本内容\n第三行文本内容')
          .width(300)
          .fontSize(16)
          .textAlign(TextAlign.End)
          .border({ width: 1, color: Color.Gray })
          .padding(10)
          .margin(10)
          .id('text_multi_end_0050')
      }
      .width('100%')
      .padding(20)
    }
  }
}

