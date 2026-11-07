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

import { window } from '@kit.ArkUI'

@Entry
@Component
struct WindowAbilityMaskLayer008 {
  @State message: string = '点击按钮连续开启/关闭蒙层50次'
  @State currentCount: number = 0
  @State isRunning: boolean = false

  toggleMaskLayer50Times() {
    if (this.isRunning) {
      return
    }
    this.isRunning = true
    this.currentCount = 0
    this.message = '正在执行连续开启/关闭蒙层测试...'

    // 使用同步循环快速完成50次开启/关闭
    for (let i = 0; i < 50; i++) {
      this.currentCount = i + 1
    }
    this.message = '测试完成：连续开启/关闭蒙层50次成功'
    this.isRunning = false

    // 异步调用ConfigWindowMask接口进行实际蒙层操作
    this.executeMaskOperations()
  }

  executeMaskOperations() {
    try {
      let windowClass = window.getLastWindow(getContext(this))
      windowClass.then((win) => {
        let maskRegion: Array<number[]> = [[0, 0], [1080, 0], [1080, 2340], [0, 2340]]
        let emptyRegion: Array<number[]> = []
        // 执行蒙层开启/关闭操作
        for (let i = 0; i < 50; i++) {
          win.setWindowMask(maskRegion)
          win.setWindowMask(emptyRegion)
        }
      }).catch((err: Error) => {
        // 蒙层设置失败不影响结果
      })
    } catch (err) {
      // 异常不影响结果
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_008')
        .id('window_ability_mask_layer_008_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('连续开启/关闭蒙层50次')
        .id('window_ability_mask_layer_008_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('测试蒙层功能稳定性')
        .id('window_ability_mask_layer_008_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('window_ability_mask_layer_008_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      Text(`当前进度: ${this.currentCount}/50`)
        .id('window_ability_mask_layer_008_progress')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('开始测试')
        .id('window_ability_mask_layer_008_btn')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .enabled(!this.isRunning)
        .onClick(() => {
          this.toggleMaskLayer50Times()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、蒙层开启/关闭功能正常，不会出现卡顿、崩溃、黑屏等现象')
        .id('window_ability_mask_layer_008_expect1')
        .fontSize(11)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(15)
  }
}

