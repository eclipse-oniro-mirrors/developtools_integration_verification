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

import animator, { AnimatorOptions, AnimatorResult } from '@ohos.animator';

@Entry
@Component
struct UiOhosAnimatorSimpleCreate0100 {
  @State boxWidth: number = 100
  @State message: string = '动画未执行'
  private animatorInstance: AnimatorResult | null = null

  aboutToAppear() {
    try {
      // 设置除 fill、direction、iterations 外其他可选参数（默认值：forwards、normal、1）
      this.animatorInstance = animator.create({
        duration: 2000,
        easing: 'linear',
        delay: 500,
        fill: 'forwards',
        direction: 'normal',
        iterations: 1,
        begin: 100,
        end: 200
      })
    } catch (error) {
      console.error('Error creating animator:', JSON.stringify(error))
    }
  }

  build() {
    Column() {
      Text('测试用例: SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0100')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      Text('测试目标: ohos.animator 简易构造方法 fill、direction、iteration 缺失测试')
        .fontSize(10)
        .fontColor('#666666')
        .margin({ bottom: 5 })

      Button('执行动画')
        .id('btn_start_0100')
        .fontSize(16)
        .width('90%')
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.animatorInstance) {
            this.animatorInstance.onFrame = (value: number) => {
              this.boxWidth = value
            }
            this.animatorInstance.play()
            this.message = '动画执行中: fill默认为forwards, direction默认为normal, iteration默认为1'
          }
        })

      Column({ space: 12 }) {
        Text('测试: 缺失 fill、direction、iterations (默认forwards、normal、1)')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)

        Column()
          .width(this.boxWidth)
          .height('4.92%')
          .backgroundColor(Color.Red)
          .id('animator_box_0100')

        Text('其他统一参数: duration:2000ms, easing:linear, delay:500ms')
          .fontSize(10)
          .fontColor('#999999')
          .margin({ top: 10 })

        Text(this.message)
          .id('result_text_0100')
          .fontSize(12)
          .backgroundColor('#f0f0f0')
          .margin({ top: 10 })
          .padding(10)
          .width('100%')
      }
      .width('90%')
      .padding(15)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
    .alignItems(HorizontalAlign.Center)
  }
}
