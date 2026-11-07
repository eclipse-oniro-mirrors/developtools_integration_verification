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

class MyTextClockStyle0140 implements ContentModifier<TextClockConfiguration> {
  public currentTimeZoneOffset: number = new Date().getTimezoneOffset() / 60;
  public title: string = '';

  constructor(title: string) {
    this.title = title;
  }

  applyContent(): WrappedBuilder<[TextClockConfiguration]> {
    return wrapBuilder(buildTextClock0140);
  }
}

@Builder
function buildTextClock0140(config: TextClockConfiguration) {
  Column() {
    Text('timeZoneOffset: ' + config.timeZoneOffset)
      .fontSize(20)
      .fontColor(Color.Orange)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
    
    TimePicker({
      selected: (new Date(config.timeValue * 1000 +
        ((config.contentModifier as MyTextClockStyle0140).currentTimeZoneOffset - config.timeZoneOffset) * 60 * 60 *
          1000)),
      format: TimePickerFormat.HOUR_MINUTE_SECOND
    })
      .useMilitaryTime(!config.started)
  }
}

@Entry
@Component
struct TextClockContentModifier0140 {
  @State timeZoneOffset: number | undefined = undefined; // 1、設置屬性timeZoneOffset參數為-9.1
  controller: TextClockController = new TextClockController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      // 3、查看builder中timeZoneOffset對應的顯示內容
      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller })
        .format('aa hh:mm:ss')
        .fontSize(30)
        .contentModifier(new MyTextClockStyle0140('ContentModifier:'))
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xf8f9fa)
  }
}
