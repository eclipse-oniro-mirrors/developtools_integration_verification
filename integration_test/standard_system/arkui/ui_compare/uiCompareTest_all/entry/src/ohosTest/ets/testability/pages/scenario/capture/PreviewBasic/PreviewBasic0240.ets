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
struct PreviewBasic0240 {
  @State accumulateTime: number = 0;
  controller: TextClockController = new TextClockController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Current milliseconds is ' + this.accumulateTime)
        .fontSize(20)
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .format('aa hh:mm:ss')
        .fontSize(60)
        .fontColor('#FF6B35')
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
        .fontFamily('Arial')
        .textShadow({ radius: 8, color: '#FF6B3580', offsetX: 4, offsetY: 4 })
        .onDateChange((value: number) => {
          this.accumulateTime = value;
        })
        .margin(20)
      Button('start TextClock')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.controller.start();
        })
      Button('stop TextClock')
        .onClick(() => {
          this.controller.stop();
        })
    }
    .width('100%')
    .height('100%')
  }
}
