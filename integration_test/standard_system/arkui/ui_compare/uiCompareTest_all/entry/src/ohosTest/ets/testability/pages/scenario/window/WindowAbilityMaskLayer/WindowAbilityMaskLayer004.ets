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
struct WindowAbilityMaskLayer004 {
  @State message: string = '点击按钮开启窗口蒙层'
  @State maskEnabled: boolean = false

  enableMaskLayer() {
    try {
      // 调用ConfigWindowMask接口，设置为true开启蒙层
      let windowClass = window.getLastWindow(getContext(this))
      windowClass.then((win) => {
        // 设置窗口蒙层为开启状态，覆盖整个屏幕（窗口最大化）
        let maskRegion: Array<number[]> = [[0, 0], [1080, 0], [1080, 2340], [0, 2340]]
        win.setWindowMask(maskRegion)
        this.maskEnabled = true
        this.message = '蒙层已开启，点击关闭蒙层按钮'
      }).catch((err: Error) => {
        this.message = `开启蒙层失败: ${err.message}`
      })
    } catch (err) {
      this.message = `操作异常: ${(err as Error).message}`
    }
  }

  disableMaskLayer() {
    try {
      // 调用ConfigWindowMask接口，设置为false关闭蒙层
      let windowClass = window.getLastWindow(getContext(this))
      windowClass.then((win) => {
        // 设置窗口蒙层为关闭状态
        let maskRegion: Array<number[]> = []
        win.setWindowMask(maskRegion)
        this.maskEnabled = false
        this.message = '蒙层已关闭'
      }).catch((err: Error) => {
        this.message = `关闭蒙层失败: ${err.message}`
      })
    } catch (err) {
      this.message = `操作异常: ${(err as Error).message}`
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_004')
        .id('window_ability_mask_layer_004_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('窗口最大化，蒙层开启/关闭')
        .id('window_ability_mask_layer_004_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('点击开启蒙层，再点击关闭蒙层')
        .id('window_ability_mask_layer_004_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('window_ability_mask_layer_004_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('开启蒙层')
        .id('window_ability_mask_layer_004_open_btn')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.enableMaskLayer()
        })

      Button('关闭蒙层')
        .id('window_ability_mask_layer_004_close_btn')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.disableMaskLayer()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、窗口蒙层开启，盖住当前窗口（整个屏幕）')
        .id('window_ability_mask_layer_004_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、蒙层关闭')
        .id('window_ability_mask_layer_004_expect2')
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

