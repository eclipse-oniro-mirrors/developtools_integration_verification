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
struct UiOhosAnimatorSimpleCreate0080 {
  @State boxWidth1: number = 100
  @State boxWidth2: number = 100
  @State boxWidth3: number = 100
  @State boxWidth4: number = 100
  @State boxWidth5: number = 100
  @State boxWidth6: number = 100
  @State message: string = '动画未执行'
  private animatorInstance1: AnimatorResult | null = null
  private animatorInstance2: AnimatorResult | null = null
  private animatorInstance3: AnimatorResult | null = null
  private animatorInstance4: AnimatorResult | null = null
  private animatorInstance5: AnimatorResult | null = null
  private animatorInstance6: AnimatorResult | null = null

  aboutToAppear() {
    try {
      // 测试1：设置除 easing、delay、fill 外其他可选参数（默认值：ease、0、forwards）
      this.animatorInstance1 = animator.create({
        duration: 2000,
        easing: 'ease',
        delay: 0,
        fill: 'forwards',
        direction: 'alternate',
        iterations: 2,
        begin: 100,
        end: 200
      })

      // 测试2：设置除 easing、delay、direction 外其他可选参数（默认值：ease、0、normal）
      this.animatorInstance2 = animator.create({
        duration: 2000,
        easing: 'ease',
        delay: 0,
        fill: 'both',
        direction: 'normal',
        iterations: 2,
        begin: 100,
        end: 200
      })

      // 测试3：设置除 easing、delay、iteration 外其他可选参数（默认值：ease、0、1）
      this.animatorInstance3 = animator.create({
        duration: 2000,
        easing: 'ease',
        delay: 0,
        fill: 'both',
        direction: 'alternate',
        iterations: 1,
        begin: 100,
        end: 200
      })

      // 测试4：设置除 easing、fill、direction 外其他可选参数（默认值：ease、forwards、normal）
      this.animatorInstance4 = animator.create({
        duration: 2000,
        easing: 'ease',
        delay: 500,
        fill: 'forwards',
        direction: 'normal',
        iterations: 2,
        begin: 100,
        end: 200
      })

      // 测试5：设置除 easing、fill、iteration 外其他可选参数（默认值：ease、forwards、1）
      this.animatorInstance5 = animator.create({
        duration: 2000,
        easing: 'ease',
        delay: 500,
        fill: 'forwards',
        direction: 'alternate',
        iterations: 1,
        begin: 100,
        end: 200
      })

      // 测试6：设置除 easing、direction、iteration 外其他可选参数（默认值：ease、normal、1）
      this.animatorInstance6 = animator.create({
        duration: 2000,
        easing: 'ease',
        delay: 500,
        fill: 'both',
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
      Text('测试用例: SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0080')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      Text('测试目标: ohos.animator 简易构造方法 easing 与另两个可选参数缺失测试')
        .fontSize(10)
        .fontColor('#666666')
        .margin({ bottom: 5 })

      Button('执行所有动画对比')
        .id('btn_start_all_0080')
        .fontSize(14)
        .width('90%')
        .margin({ bottom: 8 })
        .onClick(() => {
          if (this.animatorInstance1) {
            this.animatorInstance1.onFrame = (value: number) => { this.boxWidth1 = value }
            this.animatorInstance1.play()
          }
          if (this.animatorInstance2) {
            this.animatorInstance2.onFrame = (value: number) => { this.boxWidth2 = value }
            this.animatorInstance2.play()
          }
          if (this.animatorInstance3) {
            this.animatorInstance3.onFrame = (value: number) => { this.boxWidth3 = value }
            this.animatorInstance3.play()
          }
          if (this.animatorInstance4) {
            this.animatorInstance4.onFrame = (value: number) => { this.boxWidth4 = value }
            this.animatorInstance4.play()
          }
          if (this.animatorInstance5) {
            this.animatorInstance5.onFrame = (value: number) => { this.boxWidth5 = value }
            this.animatorInstance5.play()
          }
          if (this.animatorInstance6) {
            this.animatorInstance6.onFrame = (value: number) => { this.boxWidth6 = value }
            this.animatorInstance6.play()
          }
          this.message = '所有动画同时执行，对比不同参数效果'
        })

      Scroll() {
        Column({ space: 5 }) {
          Text('测试1: 缺失 easing、delay、fill (默认ease、0ms、forwards)')
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
          Column().width(this.boxWidth1).height('1.64%').backgroundColor(Color.Red).id('animator_box_0080_1')
          Divider().strokeWidth(0.5)

          Text('测试2: 缺失 easing、delay、direction (默认ease、0ms、normal)')
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
          Column().width(this.boxWidth2).height('1.64%').backgroundColor(Color.Blue).id('animator_box_0080_2')
          Divider().strokeWidth(0.5)

          Text('测试3: 缺失 easing、delay、iteration (默认ease、0ms、1)')
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
          Column().width(this.boxWidth3).height('1.64%').backgroundColor(Color.Green).id('animator_box_0080_3')
          Divider().strokeWidth(0.5)

          Text('测试4: 缺失 easing、fill、direction (默认ease、forwards、normal)')
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
          Column().width(this.boxWidth4).height('1.64%').backgroundColor(Color.Orange).id('animator_box_0080_4')
          Divider().strokeWidth(0.5)

          Text('测试5: 缺失 easing、fill、iteration (默认ease、forwards、1)')
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
          Column().width(this.boxWidth5).height('1.64%').backgroundColor(Color.Pink).id('animator_box_0080_5')
          Divider().strokeWidth(0.5)

          Text('测试6: 缺失 easing、direction、iteration (默认ease、normal、1)')
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
          Column().width(this.boxWidth6).height('1.64%').backgroundColor(Color.Gray).id('animator_box_0080_6')

          Text('其他统一参数: duration:2000ms, delay:500ms, fill:both, direction:alternate, iterations:2')
            .fontSize(9)
            .fontColor('#999999')
            .margin({ top: 8 })

          Text(this.message)
            .id('result_text_0080')
            .fontSize(10)
            .backgroundColor('#f0f0f0')
            .margin({ top: 8 })
            .padding(8)
            .width('100%')
        }
        .width('100%')
        .padding(8)
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }
}
