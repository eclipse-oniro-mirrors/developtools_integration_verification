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
struct UiComponentButtonSliderInterFace05 {
  @State text: string = 'Multiple set showSteps';
  @State outSetValueOne: number = 50;
  @State space: number = 8;
  @State arrowPosition: ArrowPosition = ArrowPosition.END;

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
        direction: Axis.Vertical,
        reverse: false
      })
        .blockColor(Color.Grey)
        .selectedColor('#4169E1')
        .trackColor('#ADd7E6')
        .showTips(true)
        .trackThickness(5)
        .blockBorderColor(Color.Black)
        .blockBorderWidth(1)
        .showSteps(false)
        .showSteps(true)
        .stepSize(5)
        .stepColor(Color.White)
        .blockSize({width: 18, height: 18})
        .onChange((value: number, mode: SliderChangeMode) => {
          console.info('onchange success');
        })
        .id('UiComponentButtonSliderInterFace05')
    }
    .width('100%')
  }
}