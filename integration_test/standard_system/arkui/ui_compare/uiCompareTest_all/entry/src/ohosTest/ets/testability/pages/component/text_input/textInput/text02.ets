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
struct Text02 {
  @State text: string = '11111111111\n                        \n           \n          \n       '
  controller: TextInputController = new TextInputController();
  @State textHeight:Length = 16
  @State textAlign:TextAlign = TextAlign.Start;
  @State textShadows: ShadowOptions | ShadowOptions[] = [{
    radius: 10,
    color: Color.Red,
    offsetX: 10,
    offsetY: 0
  }, {
    radius: 10,
    color: Color.Orange,
    offsetX: 20,
    offsetY: 0
  },
    {
      radius: 10,
      color: Color.Yellow,
      offsetX: 30,
      offsetY: 0
    }, {
      radius: 10,
      color: Color.Green,
      offsetX: 40,
      offsetY: 0
    },
    {
      radius: 10,
      color: Color.Blue,
      offsetX: 100,
      offsetY: 0
    }]

  build() {
    Column() {
      Text() {
        ImageSpan($r('app.media.icon'))
          .width('200px')
          .height('200px')
          .objectFit(ImageFit.Fill)
          .verticalAlign(ImageSpanAlignment.CENTER)

        Span('                      ')
          .width('50%')
          .textShadow(this.textShadows)
          .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
          .fontSize(25)

        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Normal)
          .fontSize(48)

        ContainerSpan() {
          ImageSpan($r('app.media.icon'))
            .width('40vp')
            .height('40vp')
            .verticalAlign(ImageSpanAlignment.CENTER)
          Span('Hello!').fontSize('16fp').fontColor(Color.White)
        }.textBackgroundStyle({ color: '#7F007DFF', radius: '12vp' })
      }
      .id('Text02SpanBlank')
      .width('100%')
      .textIndent(10)
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
