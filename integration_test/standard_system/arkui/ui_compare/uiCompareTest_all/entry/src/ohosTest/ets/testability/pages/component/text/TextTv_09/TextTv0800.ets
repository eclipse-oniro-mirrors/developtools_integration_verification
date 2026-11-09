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
@ComponentV2
export struct TextTv0800 {
  @Local marqueeStarted: boolean = false;
  @Local marqueeState1: string = '跑马灯1';
  @Local marqueeState2: string = '跑马灯2';
  @Local marqueeState3: string = '跑马灯3';
  @Local marqueeState4: string = '跑马灯4';

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0800')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text(`测试描述：多个跑马灯同时执行，流畅无卡顿`)
          .fontSize(16)
          .fontColor(Color.Gray)

        Divider()

        Text(`测试步骤：`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 点击"开始所有跑马灯"按钮\n2. 观察4个跑马灯同时运行\n3. 验证动效流畅无卡顿`)
          .fontSize(14)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`【跑马灯1】这是第一个跑马灯，无限循环，带渐隐效果，速度较慢。This is the first marquee with infinite loop and fadeout.`)
          .id('marqueeText1')
          .fontSize(16)
          .width('100%')
          .backgroundColor('#FFE4E1')
          .padding(10)
          .textOverflow({ overflow: TextOverflow.MARQUEE })
          .marqueeOptions({
            start: this.marqueeStarted,
            loop: -1,
            fadeout: true,
            step: 4
          })
          .onMarqueeStateChange((state: MarqueeState) => {
            if (state === MarqueeState.START) {
              this.marqueeState1 = '跑马灯1：运行中';
            }
          })

        Text(this.marqueeState1)
          .fontSize(12)
          .fontColor(Color.Red)

        Text(`【跑马灯2】这是第二个跑马灯，无限循环，带渐隐效果，速度中等。This is the second marquee with infinite loop and fadeout.`)
          .id('marqueeText2')
          .fontSize(16)
          .width('100%')
          .backgroundColor('#E0FFE0')
          .padding(10)
          .textOverflow({ overflow: TextOverflow.MARQUEE })
          .marqueeOptions({
            start: this.marqueeStarted,
            loop: -1,
            fadeout: true,
            step: 8
          })
          .onMarqueeStateChange((state: MarqueeState) => {
            if (state === MarqueeState.START) {
              this.marqueeState2 = '跑马灯2：运行中';
            }
          })

        Text(this.marqueeState2)
          .fontSize(12)
          .fontColor(Color.Green)

        Text(`【跑马灯3】这是第三个跑马灯，无限循环，带渐隐效果，速度较快。This is the third marquee with infinite loop and fadeout.`)
          .id('marqueeText3')
          .fontSize(16)
          .width('100%')
          .backgroundColor('#E0E0FF')
          .padding(10)
          .textOverflow({ overflow: TextOverflow.MARQUEE })
          .marqueeOptions({
            start: this.marqueeStarted,
            loop: -1,
            fadeout: true,
            step: 12
          })
          .onMarqueeStateChange((state: MarqueeState) => {
            if (state === MarqueeState.START) {
              this.marqueeState3 = '跑马灯3：运行中';
            }
          })

        Text(this.marqueeState3)
          .fontSize(12)
          .fontColor(Color.Blue)

        Text(`【跑马灯4】这是第四个跑马灯，无限循环，带渐隐效果，速度很快。This is the fourth marquee with infinite loop and fadeout.`)
          .id('marqueeText4')
          .fontSize(16)
          .width('100%')
          .backgroundColor('#FFF0E0')
          .padding(10)
          .textOverflow({ overflow: TextOverflow.MARQUEE })
          .marqueeOptions({
            start: this.marqueeStarted,
            loop: -1,
            fadeout: true,
            step: 16
          })
          .onMarqueeStateChange((state: MarqueeState) => {
            if (state === MarqueeState.START) {
              this.marqueeState4 = '跑马灯4：运行中';
            }
          })

        Text(this.marqueeState4)
          .fontSize(12)
          .fontColor(Color.Orange)

        Divider()

        Button(`开始所有跑马灯`)
          .id('btn')
          .width('80%')
          .onClick(() => {
            this.marqueeStarted = true;
          })

        Button(`停止所有跑马灯`)
          .width('80%')
          .onClick(() => {
            this.marqueeStarted = false;
          })

        Divider()

        Text(`预期结果：`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`不同text控件有跑马灯+渐隐，动效流畅，无卡顿`)
          .fontSize(14)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
  }
}
