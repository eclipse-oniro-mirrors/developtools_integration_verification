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
struct UiComponentTextTextRichtext0150 {
  build() {
    Column() {
      // 页面描述
      Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0150')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
      Text('测试名称：接口的参数默认值')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // ImageSpan.verticalAlign使用默认值（不设置参数）
      Text('verticalAlign使用默认值（不设置）：') {
        Span('测试文本')
        ImageSpan($r('sys.media.ohos_app_icon'))
          .width(50)
          .height(50)
        Span('后续文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_verticalalign_null_0150')

      Text('verticalAlign显式使用默认值Bottom：') {
        Span('测试文本')
        ImageSpan($r('sys.media.ohos_app_icon'))
          .width(50)
          .height(50)
          .verticalAlign(ImageSpanAlignment.BOTTOM)
        Span('后续文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_verticalalign_undefined_0150')

      // ImageSpan.objectFit使用默认值（不设置参数）
      Text('objectFit使用默认值（不设置）：') {
        Span('测试文本')
        ImageSpan($r('sys.media.ohos_app_icon'))
          .width(80)
          .height(80)
        Span('后续文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_objectfit_null_0150')

      Text('objectFit显式使用默认值Fill：') {
        Span('测试文本')
        ImageSpan($r('sys.media.ohos_app_icon'))
          .width(80)
          .height(80)
          .objectFit(ImageFit.Fill)
        Span('后续文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_objectfit_undefined_0150')

      // Text.textIndent使用默认值（不设置参数）
      Text('textIndent使用默认值（不设置）的文本内容')
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_textindent_null_0150')

      Text('textIndent显式使用默认值0的文本内容')
        .width('90%')
        .fontSize(16)
        .textIndent(0)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_textindent_undefined_0150')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

