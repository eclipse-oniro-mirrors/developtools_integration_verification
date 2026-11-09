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
struct UiComponentTextTextRichtext0010 {
  build() {
    Column() {
      // 页面描述
      Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
      Text('测试名称：ImageSpan构造参数的值为null/undefined/空串/不是图片')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // ImageSpan构造参数为空串
      Text('ImageSpan参数为空串：') {
        Span('前面文本')
        ImageSpan('')
          .width(50)
          .height(50)
        Span('后面文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_imagespan_empty_0010')

      // ImageSpan构造参数不是图片
      Text('ImageSpan参数不是图片：') {
        Span('前面文本')
        ImageSpan('invalid_image_path.txt')
          .width(50)
          .height(50)
        Span('后面文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_imagespan_invalid_0010')

      // ImageSpan构造参数为不存在的路径
      Text('ImageSpan参数为不存在的路径：') {
        Span('前面文本')
        ImageSpan('path/to/nonexistent.png')
          .width(50)
          .height(50)
        Span('后面文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_imagespan_null_0010')

      // ImageSpan构造参数为错误格式
      Text('ImageSpan参数为错误格式：') {
        Span('前面文本')
        ImageSpan('###invalid###')
          .width(50)
          .height(50)
        Span('后面文本')
      }
      .width('90%')
      .fontSize(16)
      .border({ width: 1, color: Color.Gray })
      .padding(10)
      .margin(10)
      .id('text_imagespan_undefined_0010')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

