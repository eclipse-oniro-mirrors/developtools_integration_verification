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
import { i18n } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentTextTv32 {
  @State text: string =
    'The text component is used to display a piece of textual information.Support universal attributes and universal text attributes.';
  @State ellipsisModeIndex: number = 0;
  @State ellipsisMode: EllipsisMode[] = [EllipsisMode.START, EllipsisMode.CENTER, EllipsisMode.END];
  @State ellipsisModeStr: string[] = ['START', 'CENTER', 'END'];
  @State text2 : string ='change setAppPreferredLanguage to ug'
  @State text3 : string ='onMarqueeStateChange count is:'
  @State bool : boolean =true
  @State textOverflow : TextOverflow=TextOverflow.MARQUEE
  @State num : number = 0
  @State myheight : number = 100
  @State fadeout : boolean =true
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
      Text() {
        Span('123456789')
          .fontSize(50)
          .textShadow(this.textShadows)
          .fontColor(Color.Pink)
      }
      .textOverflow({ overflow: this.textOverflow })
      .fontSize(12)
      .maxLines(1)
      .border({ width: 1 })
      .height(this.myheight)
      .padding(10)
      .width('100%')
      .margin(5)
      .marqueeOptions({
        start: this.bool,
        fromStart: true,
        step: 20,
        loop: 0,
        delay: 0,
        fadeout:this.fadeout,
        marqueeStartPolicy:MarqueeStartPolicy.DEFAULT
      })
      .onMarqueeStateChange((state: MarqueeState) => {
        if (state == MarqueeState.START) {
          console.info('Succeeded in completing the onStart callback of marquee animation');
          this.text3='marquee had start'
          this.num++;
        } else if (state == MarqueeState.BOUNCE) {
          console.info('Succeeded in completing the onBounce callback of marquee animation');
          this.num++;
        } else if (state == MarqueeState.FINISH) {
          console.info('Succeeded in completing the onFinish callback of marquee animation');
          this.num++;
        }
      })
      .id('UiComponentTextTv32_01')
      Text(this.text3+this.num)
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
        Button('change system language')
          .onClick(() => {
            let appPreferredLanguage: string = i18n.System.getAppPreferredLanguage();
            console.log('appPreferredLanguage is ',appPreferredLanguage)
            if(appPreferredLanguage=='zh') {
              try {
                i18n.System.setAppPreferredLanguage('ug');
              } catch (error) {
                let err: BusinessError = error as BusinessError;
                console.error(`call System.setAppPreferredLanguage failed, error code: ${err.code}, message: ${err.message}.`);
              }
            }else {
              try {
                i18n.System.setAppPreferredLanguage('zh');
              } catch (error) {
                let err: BusinessError = error as BusinessError;
                console.error(`call System.setAppPreferredLanguage failed, error code: ${err.code}, message: ${err.message}.`);
              }
            }
          })
          .fontSize('14fp')
          .fontWeight(500)
          .id('UiComponentTextTv32_02')
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