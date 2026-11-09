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

@Builder
function sliderBuilder11(config: SliderConfiguration) {
  Row() {
    Column({ space: 30 }) {
      Progress({ value: config.value, total: config.max, type: ProgressType.Ring })
        .margin({ top: 20 })

      Button('增加')
        .onClick(() => {
          config.value = config.value + config.step;
          config.triggerChange(config.value, SliderChangeMode.Click);
        })
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
        .width(100)
        .height(25)
        .fontSize(10)
        .enabled(config.value < config.max)

      Button('减少')
        .onClick(() => {
          config.value = config.value - config.step;
          config.triggerChange(config.value, SliderChangeMode.Click);
        })
        .labelStyle({
          overflow: TextOverflow.Clip,
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
        .width(100)
        .height(25)
        .fontSize(10)
        .enabled(config.value > config.min)

      Slider({
        value: config.value,
        min: config.min,
        max: config.max,
        step: config.step,
        style: undefined
      })
        .width(300)
        .height(100)
        .trackColor('#19182431')
        .selectedBorderRadius(0)
        .blockStyle({type:SliderBlockType.DEFAULT})
        .blockBorderWidth(3)
        .selectedBorderRadius('50%')
        .blockBorderColor(Color.Pink)
        .selectedColor('#007dff')
        .blockColor(Color.Orange)
        .visibility((config.contentModifier as MySliderStyle11).showSlider ? Visibility.Visible : Visibility.Hidden)
        .showSteps(false)
        .onChange((value: number, mode: SliderChangeMode) => {
          config.triggerChange(value, mode);
        })
      Text('当前状态：' + ((config.contentModifier as MySliderStyle11).sliderChangeMode == 0 ? 'Begin'
        : ((config.contentModifier as MySliderStyle11).sliderChangeMode == 1 ? 'Moving'
          : ((config.contentModifier as MySliderStyle11).sliderChangeMode == 2 ? 'End'
            : ((config.contentModifier as MySliderStyle11).sliderChangeMode == 3 ? 'Click' : '无')))))
        .fontSize(10)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
      Text('进度值：' + config.value)
        .fontSize(10)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
      Text('最小值：' + config.min)
        .fontSize(10)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
      Text('最大值：' + config.max)
        .fontSize(10)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
      Text('步长：' + config.step)
        .fontSize(10)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
    }
    .width('80%')

  }
  .width('100%')
}

class MySliderStyle11 implements ContentModifier<SliderConfiguration> {
  public showSlider: boolean = true;
  public sliderChangeMode: number = 0;

  constructor(showSlider: boolean, sliderChangeMode: number) {
    this.showSlider = showSlider;
    this.sliderChangeMode = sliderChangeMode;
  }

  applyContent(): WrappedBuilder<[SliderConfiguration]> {
    return wrapBuilder(sliderBuilder11);
  }
}


@Entry
@Component
struct UiComponentButtonSliderSelectedBorderRadius11 {
  @State showSlider: boolean = true;
  @State sliderValue: number = 30;
  @State sliderMin: number = 0;
  @State sliderMax: number = 100;
  @State sliderStep: number = 20;
  @State sliderChangeMode: number = 0;
  @State text : string = 'slider set Style to undefined'

  build() {
    Column({ space: 8 }) {

      Row() {
        Slider({
          value: this.sliderValue,
          min: this.sliderMin,
          max: this.sliderMax,
          step: this.sliderStep,
        })
          .onChange((value: number, mode: SliderChangeMode) => {
            this.sliderValue = value;
            this.sliderChangeMode = mode;
            console.info('【SliderLog】value:' + value + 'mode:' + mode.toString());
          })
          .contentModifier(new MySliderStyle11(this.showSlider, this.sliderChangeMode))
      }
      .width('100%')

      Text(this.text)
        .width('100%')
        .fontSize(18)
        .maxLines(3)
        .textAlign(TextAlign.Start)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
        .border({ width: 1, color: 0xEEEEEE })
        .margin({
          left: 6,
          right: 6,
          bottom:30,
          top:10
        })
    }
    .width('100%')
  }
}
