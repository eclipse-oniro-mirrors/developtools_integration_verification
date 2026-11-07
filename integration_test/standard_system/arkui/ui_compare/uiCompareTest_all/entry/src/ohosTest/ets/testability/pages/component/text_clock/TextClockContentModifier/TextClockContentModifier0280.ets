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
import { hilog } from '@kit.PerformanceAnalysisKit';

class MyTextClockStyle0280 implements ContentModifier<TextClockConfiguration> {
  public currentTimeZoneOffset: number = new Date().getTimezoneOffset() / 60;
  public title: string = '';

  constructor(title: string) {
    this.title = title;
  }

  applyContent(): WrappedBuilder<[TextClockConfiguration]> {
    return wrapBuilder(buildTextClock0280);
  }
}

@Builder
function buildTextClock0280(config: TextClockConfiguration) {
  Column() {
    Text('started: ' + config.started)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })

    
    TimePicker({
      selected: (new Date(config.timeValue * 1000 +
        ((config.contentModifier as MyTextClockStyle0280).currentTimeZoneOffset - config.timeZoneOffset) * 60 * 60 *
          1000)),
      format: TimePickerFormat.HOUR_MINUTE_SECOND
    })
      .useMilitaryTime(!config.started)
  }
}

@Entry
@Component
struct TextClockContentModifier0280 {
  @State timeZoneOffset: number = -9.1; // 1、設置屬性timeZoneOffset參數為-9.1
  controller: TextClockController = new TextClockController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      // 3、查看builder中timeZoneOffset對應的顯示內容
      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller })
        .format('aa hh:mm:ss')
        .fontSize(30)
        .contentModifier(new MyTextClockStyle0280('ContentModifier:'))
        .margin({ bottom: 20 })

      // 2、点击Button，设置属性config.started参数为true
      Button('启动TextClock')
        .onClick(() => {
          this.controller.start()
        })
        .fontSize(16)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .padding({ top: 10, bottom: 10, left: 20, right: 20 })
        .id('TextClockContentModifier0280_001')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
