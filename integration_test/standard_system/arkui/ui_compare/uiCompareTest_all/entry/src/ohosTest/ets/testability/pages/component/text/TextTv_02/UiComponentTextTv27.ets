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
struct UiComponentTextTv27 {
  @State text: string =
    'The text component is used to display a piece of textual';
  @State ellipsisModeIndex: number = 0;
  @State ellipsisMode: EllipsisMode[] = [EllipsisMode.START, EllipsisMode.CENTER, EllipsisMode.END];
  @State ellipsisModeStr: string[] = ['START', 'CENTER', 'END'];
  @State text2 : string ='marqueeOptions not set delay'
  @State text3 : string ='marqueeOptions set delay to -10'
  @State bool : boolean =true
  @State textOverflow : TextOverflow=TextOverflow.MARQUEE
  @State num : number = 0
  @State delay : number = -10

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Text(this.text2)
        .fontSize(12)
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
      Text(this.text)
        .textOverflow({ overflow: this.textOverflow })
        .fontSize(12)
        .maxLines(1)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
        .margin(5)
        .marqueeOptions({
          start: this.bool,
          loop: -1,
          step:50,
          fadeout:true,
          marqueeStartPolicy:MarqueeStartPolicy.DEFAULT
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state == MarqueeState.START) {
            console.info('Succeeded in completing the onStart callback of marquee animation');
            this.num++;
          } else if (state == MarqueeState.BOUNCE) {
            console.info('Succeeded in completing the onBounce callback of marquee animation');
            this.num++;
          } else if (state == MarqueeState.FINISH) {
            console.info('Succeeded in completing the onFinish callback of marquee animation');
            this.num++;
          }
        })
        .id('UiComponentTextTv27_01')
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
      Text(this.text)
        .textOverflow({ overflow: this.textOverflow })
        .fontSize(12)
        .maxLines(1)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
        .margin(5)
        .marqueeOptions({
          start: this.bool,
          step:50,
          loop: -1,
          delay: this.delay,
          fadeout:true,
          marqueeStartPolicy:MarqueeStartPolicy.DEFAULT
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state == MarqueeState.START) {
            console.info('Succeeded in completing the onStart callback of marquee animation');
            this.num++;
          } else if (state == MarqueeState.BOUNCE) {
            console.info('Succeeded in completing the onBounce callback of marquee animation');
            this.num++;
          } else if (state == MarqueeState.FINISH) {
            console.info('Succeeded in completing the onFinish callback of marquee animation');
            this.num++;
          }
        })
        .id('UiComponentTextTv27_01')
      Row() {
        Button('change delay')
          .onClick(() => {
            this.delay=1000
          })
          .fontSize('14fp')
          .fontWeight(500)
          .id('UiComponentTextTv27_02')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 20,
            maxFontSize: 20,
            font: {
              size: 16,
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