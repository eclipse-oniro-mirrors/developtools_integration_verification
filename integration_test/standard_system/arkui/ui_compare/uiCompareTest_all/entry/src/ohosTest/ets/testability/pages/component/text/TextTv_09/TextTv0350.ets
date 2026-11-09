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
export struct TextTv0350 {
  @Local marqueeStarted: boolean = false;
  @Local marqueeState: string = '未启动';
  @Local marqueeCount: number = 0;
  @Local step: number = 6;
  @Local loop: number = -1;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0350')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：跑马灯循环未结束，重新触发start`)
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"开始跑马灯"按钮\n2. 跑马灯执行过程中，点击"修改参数"按钮\n3. 验证触发MarqueeState.START回调`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`这是一段超长的文本内容，用于测试跑马灯动态参数修改。This is a very long text content for testing marquee parameter change. 修改参数后应该重新触发START回调。`)
        .id('marqueeText')
        .fontSize(18)
        .width('100%')
        .backgroundColor('#F0F0F0')
        .padding(10)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .marqueeOptions({
          start: this.marqueeStarted,
          step: this.step,
          loop: this.loop
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state === MarqueeState.START) {
            this.marqueeCount++;
            this.marqueeState = `跑马灯START回调触发（第${this.marqueeCount}次）`;
          } else if (state === MarqueeState.FINISH) {
            this.marqueeState = '跑马灯已结束';
          }
        })

      Text(`当前状态：${this.marqueeState}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Text(`START回调次数：${this.marqueeCount}`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Text(`当前参数：step=${this.step}, loop=${this.loop}`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Button(`开始跑马灯`)
        .id('btn')
        .onClick(() => {
          this.marqueeStarted = true;
        })

      Button(`修改参数（触发重启）`)
        .onClick(() => {
          this.step = 12;
          this.loop = 3;
        })

      Button(`重置`)
        .onClick(() => {
          this.marqueeStarted = false;
          this.marqueeCount = 0;
          this.marqueeState = '未启动';
          this.step = 6;
          this.loop = -1;
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`修改参数后触发跑马灯回调MarqueeState.START`)
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
