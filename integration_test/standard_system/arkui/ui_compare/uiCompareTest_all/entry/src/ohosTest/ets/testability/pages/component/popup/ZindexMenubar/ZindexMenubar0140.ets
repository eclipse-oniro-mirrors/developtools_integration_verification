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

import { ComponentContent } from '@kit.ArkUI';

@Builder
function buildCustomDialogContent(params: CustomDialogParams) {
  Column() {
    Text('OpenCustomDialog弹框')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })

    Text('验证OpenCustomDialog组件Z序是否在menuBar之下')
      .fontSize(14)
      .margin({ bottom: 20 })

    Button('确定')
      .id('zindex_menubar_0140_confirm')
      .onClick(() => {
        params.onConfirm()
      })
      .margin(10)
  }
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(10)
}

interface CustomDialogParams {
  onConfirm: () => void
}

@Entry
@Component
struct ZindexMenubar0140 {
  @State dialogClickResult: string = ''
  private customDialogComponentId: number = 0

  aboutToAppear() {
    setTimeout(() => {
      this.openCustomDialog()
    }, 500)
  }

  openCustomDialog() {
    let uiContext = this.getUIContext()
    let promptAction = uiContext.getPromptAction()
    let contentNode = new ComponentContent(uiContext, wrapBuilder(buildCustomDialogContent), {
      onConfirm: () => {
        this.dialogClickResult = 'OpenCustomDialog确定按钮被点击'
        promptAction.closeCustomDialog(this.customDialogComponentId)
      }
    } as CustomDialogParams)

    promptAction.openCustomDialog(contentNode, {
      alignment: DialogAlignment.TopStart,
      offset: { dx: 0, dy: 20 },
      autoCancel: false
    }).then(() => {
      this.dialogClickResult = 'OpenCustomDialog已打开'
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0140')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, placement=TopStart')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开OpenCustomDialog')
        .id('zindex_menubar_0140_open')
        .onClick(() => {
          this.openCustomDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0140_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0140_result')
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

