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
struct UiOhosAnimatorSimpleCreate0050 {
  @State boxWidth1: number = 100
  @State boxWidth2: number = 100
  @State message: string = '动画未执行'
  private animatorInstance1: AnimatorResult | null = null
  private animatorInstance2: AnimatorResult | null = null

  aboutToAppear() {
    try {
      // 测试1：设置除 fill 与 direction 外其他可选参数（fill 默认为 forwards，direction 默认为 normal）
      this.animatorInstance1 = animator.create({
        duration: 2000,
        easing: 'linear',
        delay: 500,
        fill: 'forwards',
        direction: 'normal',
        iterations: 2,
        begin: 100,
        end: 200
      })

      // 测试2：设置除 fill 与 iteration 外其他可选参数（fill 默认为 forwards，iteration 默认为 1）
      this.animatorInstance2 = animator.create({
        duration: 2000,
        easing: 'linear',
        delay: 500,
        fill: 'forwards',
        direction: 'alternate',
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
      Text('测试用例: SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0050')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('测试目标: ohos.animator 简易构造方法 fill 与另一可选参数缺失测试')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Button('执行所有动画对比')
        .id('btn_start_all_0050')
        .fontSize(16)
        .width('90%')
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.animatorInstance1) {
            this.animatorInstance1.onFrame = (value: number) => {
              this.boxWidth1 = value
            }
            this.animatorInstance1.play()
          }
          if (this.animatorInstance2) {
            this.animatorInstance2.onFrame = (value: number) => {
              this.boxWidth2 = value
            }
            this.animatorInstance2.play()
          }
          this.message = '所有动画同时执行，对比不同参数效果'
        })

      Column({ space: 15 }) {
        // 测试1
        Text('测试1: 缺失 fill 与 direction (fill默认forwards, direction默认normal)')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
        Column()
          .width(this.boxWidth1)
          .height('4.92%')
          .backgroundColor(Color.Red)
          .id('animator_box_0050_1')

        Divider().strokeWidth(1)

        // 测试2
        Text('测试2: 缺失 fill 与 iteration (fill默认forwards, iteration默认1)')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
        Column()
          .width(this.boxWidth2)
          .height('4.92%')
          .backgroundColor(Color.Blue)
          .id('animator_box_0050_2')

        Text('其他统一参数: duration:2000ms, easing:linear, delay:500ms, direction:alternate, iterations:2')
          .fontSize(10)
          .fontColor('#999999')
          .margin({ top: 10 })

        Text(this.message)
          .id('result_text_0050')
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
  }
}
