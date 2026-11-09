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
import { LengthMetrics, LengthMetricsUnit, LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentButtonSliderInterFace14 {
  @State text: string = 'Dynamic change trackThickness';
  @State outSetValueOne: number = 50;
  @State space: number = 8;
  @State arrowPosition: ArrowPosition = ArrowPosition.END;
  @State trackThickness: number = 5;

  build() {
    Column() {
      Text(this.text)
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .maxLines(2)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .height(100)
      Slider({
        value: 0,
        min: 0,
        max: 100,
        step:10,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal,
        reverse: false
      })
        .blockColor(Color.Grey)
        .selectedColor('#4169E1')
        .trackColor('0xADd7E6')
        .showTips(true)
        .trackThickness(this.trackThickness)
        .blockBorderColor(Color.Black)
        .blockBorderWidth(1)
        .showSteps(true)
        .stepSize(5)
        .stepColor(Color.White)
        .onChange((value: number, mode: SliderChangeMode) => {
          console.info('onchange success');
        })
        .id('UiComponentButtonSliderInterFace14_01')
      Button('change trackThickness')
        .onClick(()=>{
          this.trackThickness+=10;
        })
        .type(ButtonType.Capsule)
        .width(100)
        .height(200)
        .backgroundColor(0x317aff)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 14,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .id('UiComponentButtonSliderInterFace14_02')
    }
    .width('100%')
  }
}