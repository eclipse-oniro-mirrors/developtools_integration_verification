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




class MyTextClockStyle0450 implements ContentModifier<TextClockConfiguration> {
  public currentTimeZoneOffset: number = new Date().getTimezoneOffset() / 60;
  public title: string = '';
  public stringdata: string = ''

  constructor(title: string,stringdata: string) {
    this.title = title;
    this.stringdata = stringdata
  }

  applyContent(): WrappedBuilder<[TextClockConfiguration]> {
    return wrapBuilder(buildTextClock0450);
  }
}

@Builder
function buildTextClock0450(config: TextClockConfiguration) {
  Column() {
    Text('started: ' + config.started)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
    Text('stringdata: ' + (config.contentModifier as MyTextClockStyle0450).stringdata)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })

    
    TimePicker({
      selected: (new Date(config.timeValue * 1000 +
        ((config.contentModifier as MyTextClockStyle0450).currentTimeZoneOffset - config.timeZoneOffset) * 60 * 60 *
          1000)),
      format: TimePickerFormat.HOUR_MINUTE_SECOND
    })
      .useMilitaryTime(!config.started)
      .backgroundColor(Color.Pink)
  }
}

@Entry
@Component
struct TextClockContentModifier0450 {
  @State accumulateTime: number = 0;
  @State useBuilder: boolean = false; // 控制是否使用builder模式的contentModifier
  // 导入对象
  controller: TextClockController = new TextClockController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      // 3、查看builder中timeZoneOffset對應的顯示內容
      TextClock({  timeZoneOffset: -8, controller: this.controller  })
        .format('aa hh:mm:ss')
        .fontSize(30)
        .contentModifier(this.useBuilder ? null : new MyTextClockStyle0450('ContentModifier:','test1'))
        .margin(20)
        .fontSize(30)

      // 2、点击Button，将contentModifier切换到builder
      Button('切换到Builder')
        .onClick(() => {
          this.useBuilder = true
        })
        .fontSize(16)
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .padding({ top: 10, bottom: 10, left: 20, right: 20 })
        .margin(10)
        .id('TextClockContentModifier0450_001')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
