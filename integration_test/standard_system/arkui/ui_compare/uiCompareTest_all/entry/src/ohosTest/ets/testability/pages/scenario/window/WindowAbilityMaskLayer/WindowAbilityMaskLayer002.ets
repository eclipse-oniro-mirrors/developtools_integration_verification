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
struct WindowAbilityMaskLayer002 {
  @State message: string = '点击按钮尝试开启窗口蒙层'
  @State maskEnabled: boolean = false

  enableMaskLayer() {
    try {
      // 调用ConfigWindowMask接口，设置为true
      // 但由于没有安装产品自定义文件（abc），蒙层不会开启
      let windowClass = window.getLastWindow(getContext(this))
      windowClass.then((win) => {
        // 设置窗口蒙层，由于无产品自定义文件，蒙层不会生效
        let maskRegion: Array<number[]> = [[0, 0], [1080, 0], [1080, 2340], [0, 2340]]
        win.setWindowMask(maskRegion)
        this.maskEnabled = true
        this.message = '已调用蒙层接口，但无产品自定义文件，蒙层不开启'
      }).catch((err: Error) => {
        this.message = `设置蒙层失败: ${err.message}`
      })
    } catch (err) {
      this.message = `操作异常: ${(err as Error).message}`
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_WINDOW_ABILITY_MASK_LAYER_002')
        .id('window_ability_mask_layer_002_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('自由窗口，ConfigWindowMask为true')
        .id('window_ability_mask_layer_002_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('无产品自定义文件（abc），蒙层不开启')
        .id('window_ability_mask_layer_002_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('window_ability_mask_layer_002_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('尝试开启蒙层')
        .id('window_ability_mask_layer_002_btn')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.enableMaskLayer()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、窗口蒙层不开启')
        .id('window_ability_mask_layer_002_expect1')
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

