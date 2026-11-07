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

import { UIContext, OverlayManager, ComponentContent } from '@kit.ArkUI'

class OverlayParams {
  dialogClickResult: (result: string) => void = () => {}
  closeOverlay: () => void = () => {}
}

@Builder
function overlayContentBuilder(params: OverlayParams) {
  Column() {
    Text('OverlayManager弹框')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })

    Text('验证UIContext拉起OverlayManager组件Z序在menuBar之下')
      .fontSize(14)
      .margin({ bottom: 20 })

    Button('确定')
      .id('zindex_menubar_0300_confirm')
      .onClick(() => {
        params.dialogClickResult('OverlayManager确定按钮被点击')
      })
      .margin(10)

    Button('关闭')
      .id('zindex_menubar_0300_close')
      .onClick(() => {
        params.closeOverlay()
      })
      .margin(10)
  }
  .width('80%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(10)
}

@Entry
@Component
struct ZindexMenubar0300 {
  @State dialogClickResult: string = ''
  private uiContext: UIContext | null = null
  private overlayManager: OverlayManager | null = null
  private overlayContent: ComponentContent<OverlayParams> | null = null

  aboutToAppear() {
    this.uiContext = this.getUIContext()
    if (this.uiContext) {
      this.overlayManager = this.uiContext.getOverlayManager()
      this.showOverlay()
    }
  }

  showOverlay() {
    if (this.overlayManager && this.uiContext) {
      let params: OverlayParams = {
        dialogClickResult: (result: string) => {
          this.dialogClickResult = result
        },
        closeOverlay: () => {
          this.hideOverlay()
        }
      }
      this.overlayContent = new ComponentContent(this.uiContext, wrapBuilder(overlayContentBuilder), params)
      this.overlayManager.addComponentContent(this.overlayContent)
    }
  }

  hideOverlay() {
    if (this.overlayManager && this.overlayContent) {
      this.overlayManager.removeComponentContent(this.overlayContent)
      this.overlayContent = null
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0300')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('UIContext拉起OverlayManager Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开OverlayManager')
        .id('zindex_menubar_0300_open')
        .onClick(() => {
          this.showOverlay()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0300_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0300_result')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}

