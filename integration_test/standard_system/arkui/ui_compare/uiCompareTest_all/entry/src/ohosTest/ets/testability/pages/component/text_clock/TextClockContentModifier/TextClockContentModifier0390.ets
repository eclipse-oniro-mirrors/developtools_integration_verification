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




class MyTextClockStyle0390 implements ContentModifier<TextClockConfiguration> {
  public currentTimeZoneOffset: number = new Date().getTimezoneOffset() / 60;
  public title: string = '';
  public stringdata: string = ''

  constructor(title: string,stringdata :string) {
    this.title = title;
    this.stringdata = stringdata
  }

  applyContent(): WrappedBuilder<[TextClockConfiguration]> {
    return wrapBuilder(buildTextClock0390);
  }
}

@Builder
function buildTextClock0390(config: TextClockConfiguration) {
  Column() {
    Text('started: ' + config.started)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
    Text('stringdata: ' + (config.contentModifier as MyTextClockStyle0390).stringdata)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
    
    TimePicker({
      selected: (new Date(config.timeValue * 1000 +
        ((config.contentModifier as MyTextClockStyle0390).currentTimeZoneOffset - config.timeZoneOffset) * 60 * 60 *
          1000)),
      format: TimePickerFormat.HOUR_MINUTE_SECOND
    })
      .useMilitaryTime(!config.started)

  }
}

@Entry
@Component
struct TextClockContentModifier0390 {
  @State accumulateTime: number = 0;
  // 导入对象
  controller: TextClockController = new TextClockController();
  @State contentModifier: MyTextClockStyle0390 = new MyTextClockStyle0390('ContentModifier:', 'TextClockContentModifier0390');

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      // 3、查看builder中timeZoneOffset對應的顯示內容
      TextClock({  timeZoneOffset: -8, controller: this.controller })
        .format('aa hh:mm:ss')
        .fontSize(30)
        .contentModifier(this.contentModifier)
        .onDateChange((value: number) => {
          this.accumulateTime = value;
        })
        .margin(20)
        .fontSize(30)

      // 2、点击Button，设置属性config.started参数为true
      Button('启动TextClock')
        .onClick(() => {
          this.controller.start()
        })
        .fontSize(16)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .padding({ top: 10, bottom: 10, left: 20, right: 20 })
        .margin(10)
        .id('TextClockContentModifier0390_001')

      // 2、点击Button，切换stringdata
      Button('修改stringdata')
        .onClick(() => {
          this.contentModifier.stringdata = 'change'
        })
        .fontSize(16)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .padding({ top: 10, bottom: 10, left: 20, right: 20 })
        .margin(10)
        .id('TextClockContentModifier0390_002')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
