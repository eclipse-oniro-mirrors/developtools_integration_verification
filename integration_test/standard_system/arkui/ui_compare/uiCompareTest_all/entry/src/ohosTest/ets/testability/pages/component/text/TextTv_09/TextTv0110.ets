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
export struct TextTv0110 {
  @Local marqueeStarted: boolean = false;
  @Local marqueeState: string = '未启动';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0110')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：marqueeOptions.fromStart不设置，启用渐隐效果`)
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"开始跑马灯"按钮\n2. 观察文字渐隐效果\n3. 验证文字存在渐隐效果`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`这是一段超长的文本内容，用于测试跑马灯渐隐效果。This is a very long text content for testing marquee fadeout effect. 文字边缘应该有渐隐效果。`)
        .id('marqueeText')
        .fontSize(18)
        .width('100%')
        .backgroundColor('#F0F0F0')
        .padding(10)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .marqueeOptions({
          start: this.marqueeStarted,
          fadeout: true
        })
        .onMarqueeStateChange((state: MarqueeState) => {
          if (state === MarqueeState.START) {
            this.marqueeState = '跑马灯已启动（带渐隐效果）';
          } else if (state === MarqueeState.FINISH) {
            this.marqueeState = '跑马灯已结束';
          }
        })

      Text(`当前状态：${this.marqueeState}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`开始跑马灯`)
        .id('btn')
        .onClick(() => {
          this.marqueeStarted = true;
        })

      Button(`停止跑马灯`)
        .onClick(() => {
          this.marqueeStarted = false;
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`文字存在渐隐效果（文字边缘逐渐淡化）`)
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
