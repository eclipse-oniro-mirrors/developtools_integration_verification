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




class MyTextClockStyle0350 implements ContentModifier<TextClockConfiguration> {
  public currentTimeZoneOffset: number = new Date().getTimezoneOffset() / 60;
  public title: string = '';
  public flag: boolean = true

  constructor(title: string,flag: boolean) {
    this.title = title;
    this.flag = flag
  }

  applyContent(): WrappedBuilder<[TextClockConfiguration]> {
    return wrapBuilder(buildTextClock0350);
  }
}

@Builder
function buildTextClock0350(config: TextClockConfiguration) {
  Column() {
    Text('started: ' + config.started)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
    Text('flag: ' + (config.contentModifier as MyTextClockStyle0350).flag)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
    
    TimePicker({
      selected: (new Date(config.timeValue * 1000 +
        ((config.contentModifier as MyTextClockStyle0350).currentTimeZoneOffset - config.timeZoneOffset) * 60 * 60 *
          1000)),
      format: TimePickerFormat.HOUR_MINUTE_SECOND
    })
      .useMilitaryTime(!config.started)

  }
}

@Entry
@Component
struct TextClockContentModifier0350 {
  @State accumulateTime: number = 0;
  // 导入对象
  controller: TextClockController = new TextClockController();
  @State contentModifier: MyTextClockStyle0350 = new MyTextClockStyle0350('ContentModifier:', true);

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
        .margin(20)
        .id('TextClockContentModifier0350_001')

      // 2、点击Button，切换flag
      Button('切换flag')
        .onClick(() => {
          this.contentModifier.flag = !this.contentModifier.flag
        })
        .fontSize(16)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .padding({ top: 10, bottom: 10, left: 20, right: 20 })
        .margin(20)
        .id('TextClockContentModifier0350_002')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
