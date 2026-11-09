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
export struct TextTv0810 {
  @Local marqueeStarted: boolean = false;
  @Local marqueeState: string = '未启动';
  @Local startCallbackCount: number = 0;
  @Local finishCallbackCount: number = 0;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0810')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：跑马灯循环100次，回调次数无丢失`)
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"开始跑马灯（100次）"按钮\n2. 等待跑马灯执行完毕\n3. 验证回调次数为100次`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`这是一段超长的文本内容，用于测试跑马灯回调次数。This is a very long text content for testing marquee callback count. 跑马灯将循环100次，验证回调次数无丢失。`)
        .id('marqueeText')
        .fontSize(18)
        .width('100%')
        .backgroundColor('#F0F0F0')
        .padding(10)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .marqueeOptions({
          start: this.marqueeStarted,
          loop: 100,
          step: 10
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state === MarqueeState.START) {
            this.startCallbackCount++;
            this.marqueeState = `跑马灯运行中：${this.startCallbackCount}/100`;
          } else if (state === MarqueeState.FINISH) {
            this.finishCallbackCount++;
            this.marqueeState = '跑马灯已结束';
          }
        })

      Text(`当前状态：${this.marqueeState}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Text(`START回调次数：${this.startCallbackCount}`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Text(`FINISH回调次数：${this.finishCallbackCount}`)
        .fontSize(14)
        .fontColor(Color.Red)

      Button(`开始跑马灯（100次）`)
        .id('btn')
        .onClick(() => {
          this.marqueeStarted = true;
        })

      Button(`重置`)
        .onClick(() => {
          this.marqueeStarted = false;
          this.startCallbackCount = 0;
          this.finishCallbackCount = 0;
          this.marqueeState = '未启动';
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`跑马灯回调次数无丢失（START回调100次，FINISH回调1次）`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
