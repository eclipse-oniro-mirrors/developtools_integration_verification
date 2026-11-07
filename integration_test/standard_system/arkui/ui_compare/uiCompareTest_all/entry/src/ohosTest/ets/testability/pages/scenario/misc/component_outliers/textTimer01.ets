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

class MyTextTimerModifier implements ContentModifier<TextTimerConfiguration> {
  constructor() {
  }

  applyContent(): WrappedBuilder<[TextTimerConfiguration]> {
    return wrapBuilder(buildTextTimer);
  }
}

@Builder
function buildTextTimer(config: TextTimerConfiguration) {
  Column() {
    Stack({ alignContent: Alignment.Center }) {
      Circle({ width: 150, height: 150 })
        .fill(config.started ? (config.isCountDown ? 0xFF232323 : 0xFF717171) : 0xFF929292)
      Column() {
        Text(config.isCountDown ? '倒计时' : '正计时').fontColor(Color.White)
        Text(
          (config.isCountDown ? '剩余' : '已经过去了') + (config.isCountDown ?
            (Math.max(config.count / 1000 - config.elapsedTime / 100, 0)).toFixed(1) + '/' +
            (config.count / 1000).toFixed(0)
            : ((config.elapsedTime / 100).toFixed(0))
          ) + '秒'
        ).fontColor(Color.White)
      }
    }
  }
}

@Entry
@Component
struct TextTimer01 {
  @State count: number = 10000;
  @State myTimerModifier: MyTextTimerModifier = new MyTextTimerModifier();
  @State format: string = 'SS';
  @State isCountDown:boolean = true;
  @State fontStyle:FontStyle = FontStyle.Normal;
  @State textShadow:ShadowOptions = {
    radius:1,
    type:ShadowType.COLOR,
    color:Color.Blue,
    offsetX:5,
    offsetY:5,
    fill:true
  }
  countDownTextTimerController: TextTimerController = new TextTimerController();
  countDownTextTimerController1: TextTimerController = new TextTimerController();

  build() {
    Row() {
      Column() {
        TextTimer({ isCountDown: this.isCountDown, count: this.count, controller: this.countDownTextTimerController })
          .format(this.format)
          .fontColor(Color.Black)
          .fontSize(30)
          .fontStyle(FontStyle.Normal)
          .fontWeight(10)
          .textShadow(this.textShadow)
          .contentModifier(this.myTimerModifier)
          .onTimer((utc: number, elapsedTime: number) => {
            console.info('textTimer onTimer utc is：' + utc + ', elapsedTime: ' + elapsedTime);
          })
          .margin(10)

        TextTimer({ isCountDown: this.isCountDown, count: this.count, controller: this.countDownTextTimerController })
          .format(this.format)
          .fontColor(Color.Pink)
          .fontSize(36)
          .fontStyle(FontStyle.Italic)
          .fontWeight(18)
          .textShadow(this.textShadow)
          .onTimer((utc: number, elapsedTime: number) => {
            console.info('textTimer onTimer utc is：' + utc + ', elapsedTime: ' + elapsedTime);
          })

        Button('format SS')
          .margin({top:30})
          .height(40)
          .id('TextTimer_01')
          .onClick( () => {
            this.format = ''
          })

        Button('format SS')
          .margin({top:30})
          .height(40)
          .id('TextTimer_02')
          .onClick( () => {
            this.format = 'SS'
          })

        Button('format ss.SS')
          .margin({top:30})
          .height(40)
          .id('TextTimer_03')
          .onClick( () => {
            this.format = 'SS'
          })

        Button('format SS')
          .margin({top:30})
          .height(40)
          .id('TextTimer_04')
          .onClick( () => {
            this.format = 'mm:ss.SS'
          })

        Button('format SS')
          .margin({top:30})
          .height(40)
          .id('TextTimer_05')
          .onClick( () => {
            this.format = 'HH:mm:ss.SS'
          })

        Button('change textShadow')
          .margin({top:30})
          .height(40)
          .id('TextTimer_06')
          .onClick( () => {
            this.textShadow = {
              radius:2,
              type:ShadowType.COLOR,
              color:Color.Red,
              offsetX:0,
              offsetY:0,
              fill:false
            }
          })

        Button('change count')
          .margin({top:30})
          .height(40)
          .id('TextTimer_07')
          .onClick( () => {
            this.count = 20000
          })

        Button('change isCountDown')
          .margin({top:30})
          .height(40)
          .id('TextTimer_08')
          .onClick( () => {
            this.isCountDown = false
          })

        Row() {
          Button('start')
            .margin({right:5})
            .height(30)
            .id('TextClock_01')
            .onClick(() => {
              this.countDownTextTimerController.start();
              this.countDownTextTimerController1.start();
            })

          Button('pause')
            .margin(10)
            .onClick(() => {
              this.countDownTextTimerController.pause();
              this.countDownTextTimerController1.pause();
            })
          Button('reset')
            .margin(10)
            .onClick(() => {
              this.countDownTextTimerController.reset();
              this.countDownTextTimerController1.reset();
            })
        }.margin(20)
      }.width('100%')
    }.height('100%')
  }
}
