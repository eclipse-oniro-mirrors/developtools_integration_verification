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
struct UiComponentTextTextRichtext0070 {
  @State indentValue: number = 4;

  build() {
    Column() {
      // 页面描述
      Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0070')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
      Text('测试名称：Text组件的缩进(纯图片)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // 单行纯图片，缩进量4
      Text() {
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
      }
      .width(300)
      .fontSize(16)
      .textIndent(4)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_pure_image_single_0070')

      // 两行纯图片，缩进量4
      Text() {
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
      }
      .width(200)
      .fontSize(16)
      .textIndent(4)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_pure_image_multi_0070')

      // 动态缩进测试
      Text() {
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
        ImageSpan($r('sys.media.ohos_app_icon')).width(40).height(40)
      }
      .width(300)
      .fontSize(16)
      .textIndent(this.indentValue)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_dynamic_indent_0070')

      Button('设置缩进为0')
        .onClick(() => {
          this.indentValue = 0;
        })
        .margin(10)
        .id('button_indent_zero_0070')

      Button('设置缩进为-5')
        .onClick(() => {
          this.indentValue = -5;
        })
        .margin(10)
        .id('button_indent_negative_0070')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

