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
struct PreviewBasic0190 {
  @State outSetValueOne: number = 40;
  @State inSetValueOne: number = 40;
  @State noneValueOne: number = 40;
  @State outSetValueTwo: number = 40;
  @State inSetValueTwo: number = 40;
  @State vOutSetValueOne: number = 40;
  @State vInSetValueOne: number = 40;
  @State vOutSetValueTwo: number = 40;
  @State vInSetValueTwo: number = 40;
  @State sliderEnabled: boolean = true;
  @State blockSize: number = 24;

  build() {
    Column({ space: 8 }) {
      Text('outset slider - 基础样式').fontSize(9).fontColor(0xCCCCCC).width('90%').margin(15)
      Row() {
        Slider({
          value: this.outSetValueOne,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet
        })
          .blockColor(Color.Blue)
          .trackColor(Color.Gray)
          .selectedColor(Color.Blue)
          .trackThickness(4)
          .blockSize({ width: 24, height: 24 })
          .showTips(true)
          .enabled(this.sliderEnabled)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueOne = value;
            console.info('value:' + value + 'mode:' + mode.toString());
          })
        // toFixed(0)将滑动条返回值处理为整数精度
        Text(this.outSetValueOne.toFixed(0)).fontSize(12)
      }
      .width('80%')
      Row() {
        Slider({
          value: this.outSetValueTwo,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.OutSet
        })
          .blockColor('#FF6B35')
          .trackColor('#E8E8E8')
          .selectedColor('#FF6B35')
          .trackThickness(6)
          .blockSize({ width: 28, height: 28 })
          .showSteps(true)
          .minLabel('0')
          .maxLabel('100')
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueTwo = value;
            console.info('value:' + value + 'mode:' + mode.toString());
          })
        Text(this.outSetValueTwo.toFixed(0)).fontSize(12)
      }
      .width('80%')

      Text('inset slider - 内嵌样式').fontSize(9).fontColor(0xCCCCCC).width('90%').margin(15)
      Row() {
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        })
          .blockColor('#191970')
          .trackColor('#ADd7E6')
          .selectedColor('#4169E1')
          .trackThickness(20)
          .blockSize({ width: 16, height: 16 })
          .showTips(true, '当前值')
          .trackBorderRadius(10)
          .blockBorderColor('#FFFFFF')
          .blockBorderWidth(2)
          .stepSize(8)
          .stepColor('#87CEEB')
          .onChange((value: number, mode: SliderChangeMode) => {
            this.inSetValueOne = value;
            console.info('value:' + value + 'mode:' + mode.toString());
          })
        Text(this.inSetValueOne.toFixed(0)).fontSize(12)
      }
      .width('80%')
      Row() {
        Slider({
          value: this.inSetValueTwo,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.InSet
        })
          .blockColor('#191970')
          .trackColor('#ADd7E6')
          .selectedColor('#4169E1')
          .trackThickness(24)
          .blockSize({ width: 20, height: 20 })
          .showSteps(true)
          .minLabel('最小')
          .maxLabel('最大')
          .blockStyle({
            type: SliderBlockType.DEFAULT,
            image: $r('sys.symbol.circle_fill')
          })
          .onChange((value: number, mode: SliderChangeMode) => {
            this.inSetValueTwo = value;
            console.info('value:' + value + 'mode:' + mode.toString());
          })
        Text(this.inSetValueTwo.toFixed(0)).fontSize(12)
      }
      .width('80%')

      Text('none slider - 无滑块样式').fontSize(9).fontColor(0xCCCCCC).width('90%').margin(15)
      Row() {
        Slider({
          value: this.noneValueOne,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.NONE
        })
          .blockColor('#191970')
          .trackColor('#ADd7E6')
          .selectedColor('#4169E1')
          .trackThickness(8)
          .showTips(true)
          .minLabel('0%')
          .maxLabel('100%')
          .trackBorderRadius(4)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.noneValueOne = value;
            console.info('value:' + value + 'mode:' + mode.toString());
          })
        Text(this.noneValueOne.toFixed(0)).fontSize(12)
      }
      .width('80%')

      Row() {
        Column() {
          Text('vertical outset slider - 垂直外凸').fontSize(9).fontColor(0xCCCCCC).width('50%').margin(15)
          Row() {
            Text().width('10%')
            Slider({
              value: this.vOutSetValueOne,
              min: 0,
              max: 100,
              step: 1,
              style: SliderStyle.OutSet,
              direction: Axis.Vertical
            })
              .blockColor('#FF5722')
              .trackColor('#FFE0B2')
              .selectedColor('#FF5722')
              .trackThickness(6)
              .blockSize({ width: 26, height: 26 })
              .showTips(true)
              .blockBorderColor('#FFFFFF')
              .blockBorderWidth(2)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vOutSetValueOne = value;
                console.info('value:' + value + 'mode:' + mode.toString());
              })
            Slider({
              value: this.vOutSetValueTwo,
              min: 0,
              max: 100,
              step: 10,
              style: SliderStyle.OutSet,
              direction: Axis.Vertical
            })
              .blockColor('#4CAF50')
              .trackColor('#C8E6C9')
              .selectedColor('#4CAF50')
              .trackThickness(8)
              .blockSize({ width: 30, height: 30 })
              .showSteps(true)
              .stepSize(10)
              .stepColor('#81C784')
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vOutSetValueTwo = value;
                console.info('value:' + value + 'mode:' + mode.toString());
              })
          }
        }.width('50%').height('24.59%')

        Column() {
          Text('vertical inset slider - 垂直内嵌').fontSize(9).fontColor(0xCCCCCC).width('50%').margin(15)
          Row() {
            Slider({
              value: this.vInSetValueOne,
              min: 0,
              max: 100,
              step: 1,
              style: SliderStyle.InSet,
              direction: Axis.Vertical,
              reverse: true // 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
            })
              .blockColor('#9C27B0')
              .trackColor('#E1BEE7')
              .selectedColor('#9C27B0')
              .trackThickness(18)
              .blockSize({ width: 14, height: 14 })
              .showTips(true, '音量')
              .trackBorderRadius(9)
              .minLabel('0')
              .maxLabel('100')
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vInSetValueOne = value;
                console.info('value:' + value + 'mode:' + mode.toString());
              })
            Slider({
              value: this.vInSetValueTwo,
              min: 0,
              max: 100,
              step: 10,
              style: SliderStyle.InSet,
              direction: Axis.Vertical,
              reverse: true
            })
              .blockColor('#00BCD4')
              .trackColor('#B2EBF2')
              .selectedColor('#00BCD4')
              .trackThickness(22)
              .blockSize({ width: 18, height: 18 })
              .showSteps(true)
              .stepSize(12)
              .stepColor('#4DD0E1')
              .blockStyle({
                type: SliderBlockType.DEFAULT
              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vInSetValueTwo = value;
                console.info('value:' + value + 'mode:' + mode.toString());
              })
          }
        }.width('50%').height('24.59%')
      }
    }.width('100%')
  }
}
