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
struct UiOhosAnimatorSimpleCreate0150 {
  @State boxWidth: number = 100
  @State message: string = '动画未执行'
  private animatorInstance: AnimatorResult | null = null

  aboutToAppear() {
    try {
      // 仅设置 direction 与 iteration（默认值：1000、ease、0、forwards）
      this.animatorInstance = animator.create({
        duration: 1000,
        easing: 'ease',
        delay: 0,
        fill: 'forwards',
        direction: 'alternate',
        iterations: 2,
        begin: 100,
        end: 200
      })
    } catch (error) {
      console.error('Error creating animator:', JSON.stringify(error))
    }
  }

  build() {
    Column() {
      Text('测试用例: SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0150')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('测试目标: ohos.animator 简易构造方法仅设置 direction 与 iteration 测试')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Button('执行动画')
        .id('btn_start_0150')
        .fontSize(16)
        .width('90%')
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.animatorInstance) {
            this.animatorInstance.onFrame = (value: number) => {
              this.boxWidth = value
            }
            this.animatorInstance.play()
            this.message = '动画执行中: direction为alternate, iteration为2'
          }
        })

      Column({ space: 15 }) {
        Text('测试: 仅设置 direction:alternate 与 iterations:2（其他默认）')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)

        Column()
          .width(this.boxWidth)
          .height('6.56%')
          .backgroundColor(Color.Red)
          .id('animator_box_0150')

        Text(this.message)
          .id('result_text_0150')
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
