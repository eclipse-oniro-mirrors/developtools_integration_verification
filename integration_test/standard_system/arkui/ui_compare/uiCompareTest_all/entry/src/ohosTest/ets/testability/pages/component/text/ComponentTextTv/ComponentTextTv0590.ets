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
struct ComponentTextTv0590 {

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Text('marquee').fontSize(9).fontColor(0xCCCCCC)
      // 设置文本超长时以跑马灯的方式展示
      Text() {
        ImageSpan($r('app.media.icon'))
          .width('200px')
          .height('200px')
          .objectFit(ImageFit.Fill)
          .verticalAlign(ImageSpanAlignment.CENTER)
        Span('This is the text with the text overflow set marquee,his is the text with the text overflow set marquee,his is the text with the text overflow set marquee,his is the text with the text overflow set marquee')
          .decoration({ type: TextDecorationType.LineThrough, color: Color.Red }).fontSize(25)
      }
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .marqueeOptions({
          start: true,
          fromStart: true,
          step: 500,
          loop: 1,
          delay: 0,
          fadeout: true,
          marqueeStartPolicy: MarqueeStartPolicy.DEFAULT
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state == MarqueeState.START) {
            // "收到状态: START";
          } else if (state == MarqueeState.BOUNCE) {
            // "收到状态: BOUNCE";
          } else if (state == MarqueeState.FINISH) {
            // "收到状态: FINISH";
          }
        })
    }
  }
}
