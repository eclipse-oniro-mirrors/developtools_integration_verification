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
struct TextClockSet01 {
  @State accumulateTime: number = 0;
  @State timeZoneOffset: number = -8;
  controller1: TextClockController = new TextClockController();
  controller2: TextClockController = new TextClockController();
  controller3: TextClockController = new TextClockController();
  controller4: TextClockController = new TextClockController();
  controller5: TextClockController = new TextClockController();
  controller6: TextClockController = new TextClockController();
  @State textShadows1: ShadowOptions | ShadowOptions[] = [
    {
      radius: 10,
      color: Color.Red,
      offsetX: 1,
      offsetY: 0
    }
  ];
  @State textShadows2: ShadowOptions | ShadowOptions[] = [
    {
      radius: 10,
      color: Color.Red,
      offsetX: 0,
      offsetY: 0
    }
  ];
  @State textShadows3: ShadowOptions | ShadowOptions[] = [
    {
      radius: 10,
      color: Color.Red,
      offsetX: -1,
      offsetY: 0
    }
  ];
  @State textShadows4: ShadowOptions | ShadowOptions[] = [
    {
      radius: 10,
      color: Color.Red,
      offsetX: 100,
      offsetY: 0
    }
  ];
  @State textShadows5: ShadowOptions | ShadowOptions[] = [
    {
      radius: 10,
      color: Color.Red,
      offsetX: undefined,
      offsetY: 0
    }
  ];

  build() {
    Column() {
      Column() {
        Text('1')
          .textAlign(TextAlign.Center)
          .margin(10)
          .fontSize(20)
        TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller1 })
          .format('aa hh:mm:ss')
          .textShadow(this.textShadows1)
          .onDateChange((value: number) => {
            this.accumulateTime = value;
          })
          .margin(20)
          .fontSize(30)
      }.width('80%')
      .margin({top:'5%'})

      Column() {
        Text('0')
          .textAlign(TextAlign.Center)
          .margin(10)
          .fontSize(20)
        TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller2 })
          .format('aa hh:mm:ss')
          .textShadow(this.textShadows2)
          .onDateChange((value: number) => {
            this.accumulateTime = value;
          })
          .margin(20)
          .fontSize(30)
      }.width('80%')
      .margin({top:'5%'})

      Column() {
        Text('-1')
          .textAlign(TextAlign.Center)
          .margin(10)
          .fontSize(20)
        TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller3 })
          .format('aa hh:mm:ss')
          .textShadow(this.textShadows3)
          .onDateChange((value: number) => {
            this.accumulateTime = value;
          })
          .margin(20)
          .fontSize(30)
      }.width('80%')
      .margin({top:'5%'})

      Column() {
        Text('100')
          .textAlign(TextAlign.Center)
          .margin(10)
          .fontSize(20)
        TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller4 })
          .format('aa hh:mm:ss')
          .textShadow(this.textShadows4)
          .onDateChange((value: number) => {
            this.accumulateTime = value;
          })
          .margin(20)
          .fontSize(30)
      }.width('80%')
      .margin({top:'5%'})

      Column() {
        Text('undefined')
          .textAlign(TextAlign.Center)
          .margin(10)
          .fontSize(20)
        TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller5 })
          .format('aa hh:mm:ss')
          .textShadow(this.textShadows5)
          .onDateChange((value: number) => {
            this.accumulateTime = value;
          })
          .margin(20)
          .fontSize(30)
      }.width('80%')
      .margin({top:'5%'})
    }.width('100%').height('100%')
  }
}
