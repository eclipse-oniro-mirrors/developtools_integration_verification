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
struct TextSpanLayout0010 {

  build() {
    Column() {
      Text('Span组件布局测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 父组件设置固定宽度，测试Span组件适应文本大小且不超过父组件大小
      Column() {
        Text() {
          Span('这是一段测试文本，')
            .fontSize(16)
            .fontColor(Color.Black)
          Span('Span组件会适应文本大小，')
            .fontSize(16)
            .fontColor(Color.Blue)
          Span('且不会超过父组件的宽度。')
            .fontSize(16)
            .fontColor(Color.Red)
        }
        .id('text_span_layout_0010')
        .width('100%')
      }
      .width('41.67%')
      .padding(10)
      .borderWidth(1)
      .borderColor(Color.Gray)
      .backgroundColor('#F5F5F5')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}


