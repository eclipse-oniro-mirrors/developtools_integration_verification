/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentTextTv01 {
  @State text: string =
    'The text component is used to display a piece of textual information.Support universal attributes and universal text attributes.';
  @State ellipsisModeIndex: number = 0;
  @State ellipsisMode: EllipsisMode[] = [EllipsisMode.START, EllipsisMode.CENTER, EllipsisMode.END];
  @State ellipsisModeStr: string[] = ['START', 'CENTER', 'END'];
  @State text2 : string ='start set loop to 1.5'
  @State text3 : string ='marquee not finish'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Text(this.text2)
        .fontSize(18)
        .width('100%')
        .width('100%')
        .height(200)
        .maxLines(3)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
        .border({ width: 1, color: 0xEEEEEE })
        .padding(10)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
      Text('This is the text with the text overflow set marquee')
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .marqueeOptions({
          start: true,
          fromStart: true,
          step: 30,
          loop: 1.5,
          delay: 0,
          fadeout: false,
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state == MarqueeState.START) {
            console.info('Succeeded in completing the onStart callback of marquee animation');
          } else if (state == MarqueeState.BOUNCE) {
            console.info('Succeeded in completing the onBounce callback of marquee animation');
          } else if (state == MarqueeState.FINISH) {
            console.info('Succeeded in completing the onFinish callback of marquee animation');
            this.text3='marquee had finish'
          }
        })
      Text(this.text3)
        .fontSize(18)
        .width('100%')
        .height(100)
        .maxLines(3)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
        .border({ width: 1, color: 0xEEEEEE })
        .padding(10)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
      Row() {
        Button('更改省略号位置：' + this.ellipsisModeStr[this.ellipsisModeIndex])
          .onClick(() => {
            this.ellipsisModeIndex++;
            if (this.ellipsisModeIndex > (this.ellipsisModeStr.length - 1)) {
              this.ellipsisModeIndex = 0;
            }
          })
          .fontSize('16fp')
          .fontWeight(500)
          .id('UiComponentTextTv01')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 20,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .backgroundColor('#007DFF')
      }
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}
