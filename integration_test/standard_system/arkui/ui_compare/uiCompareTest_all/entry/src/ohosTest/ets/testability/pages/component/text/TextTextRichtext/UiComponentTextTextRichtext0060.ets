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
struct UiComponentTextTextRichtext0060 {
  @State indentValue: number = 4;

  build() {
    Column() {
      // 页面描述
      Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0060')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
      Text('测试名称：Text组件的缩进(图文混排)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // 图片位于行首，缩进量4
      Text() {
        ImageSpan($r('sys.media.ohos_app_icon')).width(30).height(30)
        Span('图片位于行首的文本内容')
      }
      .width(300)
      .fontSize(16)
      .textIndent(4)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_image_start_0060')

      // 图片位于中间，缩进量4
      Text() {
        Span('文本内容')
        ImageSpan($r('sys.media.ohos_app_icon')).width(30).height(30)
        Span('后续文本')
      }
      .width(300)
      .fontSize(16)
      .textIndent(4)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_image_middle_0060')

      // 图片位于行尾，缩进量4
      Text() {
        Span('文本内容图片在行尾')
        ImageSpan($r('sys.media.ohos_app_icon')).width(30).height(30)
      }
      .width(300)
      .fontSize(16)
      .textIndent(4)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_image_end_0060')

      // 动态缩进测试
      Text() {
        ImageSpan($r('sys.media.ohos_app_icon')).width(30).height(30)
        Span('动态缩进测试文本')
      }
      .width(300)
      .fontSize(16)
      .textIndent(this.indentValue)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_dynamic_indent_0060')

      Button('设置缩进为0')
        .onClick(() => {
          this.indentValue = 0;
        })
        .margin(10)
        .id('button_indent_zero_0060')

      Button('设置缩进为-5')
        .onClick(() => {
          this.indentValue = -5;
        })
        .margin(10)
        .id('button_indent_negative_0060')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

