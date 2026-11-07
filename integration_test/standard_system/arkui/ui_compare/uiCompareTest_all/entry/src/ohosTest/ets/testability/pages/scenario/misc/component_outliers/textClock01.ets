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

class MyTextClockStyle implements ContentModifier<TextClockConfiguration> {
  public currentTimeZoneOffset: number = new Date().getTimezoneOffset() / 60;
  public title: string = '';

  constructor(title: string) {
    this.title = title;
  }

  applyContent(): WrappedBuilder<[TextClockConfiguration]> {
    return wrapBuilder(buildTextClock);
  }
}

@Builder
function buildTextClock(config: TextClockConfiguration) {
  Row() {
    Column() {
      Text((config.contentModifier as MyTextClockStyle).title)
        .fontSize(20)
        .margin(20)
      TimePicker({
        selected: (new Date(config.timeValue * 1000 +
          ((config.contentModifier as MyTextClockStyle).currentTimeZoneOffset - config.timeZoneOffset) * 60 * 60 *
            1000)),
        format: TimePickerFormat.HOUR_MINUTE_SECOND
      })
        .useMilitaryTime(!config.started)
    }
  }
}

@Entry
@Component
struct TextClock01 {
  @State accumulateTime1: number = 0;
  @State timeZoneOffset: number = -8;
  @State format: string = 'SS';
  @State textShadow:ShadowOptions = {
    radius:1,
    type:ShadowType.COLOR,
    color:Color.Blue,
    offsetX:5,
    offsetY:5,
    fill:true
  }
  @State dateTimeOptions:Optional<DateTimeOptions> = { hour: 'numeric' };
  controller1: TextClockController = new TextClockController();
  controller2: TextClockController = new TextClockController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Clock' + this.accumulateTime1)
        .fontSize(20)
        .margin({ top: 20 })

      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller1 })
        .format(this.format)
        .fontColor(Color.Black)
        .fontSize(30)
        .fontStyle(FontStyle.Normal)
        .fontWeight(10)
        .fontSize(30)
        .textShadow(this.textShadow)
        .fontFeature('<feature-tag-value>')
        .dateTimeOptions(this.dateTimeOptions)
        .onDateChange((value: number) => {
          this.accumulateTime1 = value;
        })
        .margin(20)
        .fontSize(30)
      
      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller2 })
        .format(this.format)
        .fontColor(Color.Black)
        .fontSize(30)
        .fontStyle(FontStyle.Normal)
        .fontWeight(10)
        .fontSize(30)
        .textShadow(this.textShadow)
        .fontFeature('<feature-tag-value>')
        .dateTimeOptions(this.dateTimeOptions)
        .contentModifier(new MyTextClockStyle('ContentModifier:'))

      Button('format yyyy-MM-dd')
        .margin({top:30})
        .height('1%')
        .id('TextClock_01')
        .onClick( () => {
          this.format = '';
        })

      Button('format yyyy-MM-dd')
        .margin({top:30})
        .height('1%')
        .id('TextClock_02')
        .onClick( () => {
          this.format = 'yyyy-MM-dd';
        })

      Button('format yyyy-M-dd')
        .margin({top:30})
        .height('1%')
        .id('TextClock_03')
        .onClick( () => {
          this.format = 'yyyy-M-dd';
        })

      Button('format yyyy-M-dd-EEEE')
        .margin({top:30})
        .height('1%')
        .id('TextClock_04')
        .onClick( () => {
          this.format = 'yyyy-M-dd-EEEE';
        })

      Button('format yyyy-M-dd-EEEE-HH:mm:ss')
        .margin({top:30})
        .height('1%')
        .id('TextClock_05')
        .onClick( () => {
          this.format = 'yyyy-M-dd-EEEE-HH:mm:ss';
        })

      Button('format HH:mm:ss:SS:SSS aa')
        .margin({top:30})
        .height('1%')
        .id('TextClock_06')
        .onClick( () => {
          this.format = 'HH:mm:ss:SS:SSS aa';
        })

      Button('change textShadow')
        .margin({top:30})
        .height('1%')
        .id('TextClock_07')
        .onClick( () => {
          this.textShadow = {
            radius:2,
            type:ShadowType.COLOR,
            color:Color.Red,
            offsetX:0,
            offsetY:0,
            fill:false
          };
        })

      Button('change textShadow')
        .margin({top:30})
        .height('1%')
        .id('TextClock_08')
        .onClick( () => {
          this.dateTimeOptions = { hour: '2-digit' };
        })

      Button('start TextClock')
        .margin({ top: 20, bottom: 10 })
        .onClick(() => {
          // 启动文本时钟
          this.controller1.start();
          this.controller2.start();
        })
      Button('stop TextClock')
        .margin({ bottom: 30 })
        .onClick(() => {
          // 停止文本时钟
          this.controller1.stop();
          this.controller2.stop();
        })
    }
    .width('100%')
    .height('100%')
  }
}
