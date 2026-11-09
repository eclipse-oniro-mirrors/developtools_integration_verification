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

import { ComponentContent, OverlayManager } from '@kit.ArkUI';

// 自定义Overlay内容组件
@Builder
function overlayContentBuilder(text: string) {
  Column() {
    Text(text)
      .fontSize(20)
      .fontColor(Color.White)
      .padding(10)
  }
  .width('80%')
  .height('100%')
  .backgroundColor(Color.Blue)
  .borderRadius(10)
  .justifyContent(FlexAlign.Center)
}

@Entry
@Component
struct OverlaymanagerLevel0070 {
  @State currentLevel: number = 0
  @State hasOverlay: boolean = false
  @State resultText: string = ''
  private uiContext: UIContext = this.getUIContext()
  private overlayManager: OverlayManager = this.uiContext.getOverlayManager()
  private overlayContent: ComponentContent<string> | null = null

  build() {
    Column() {
      Text('OverlayManager Level Test - 0070')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('overlay_level_0070_title')

      // 步骤3：点击任意层级按钮
      Button('任意层级')
        .id('button_any_level_0070')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.currentLevel = 1
          this.addOverlayWithLevel(1)
        })

      // 步骤3：点击reqpermissions按钮
      Button('reqpermissions')
        .id('button_reqpermissions_0070')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          // 模拟请求权限，触发Modal UIExtension
          this.resultText = 'overlay弹窗不会覆盖在Modal UIExtension之上'
        })

      // 显示当前层级
      Text(`当前层级: ${this.currentLevel}`)
        .fontSize(16)
        .margin({ bottom: 15 })
        .id('text_current_level_0070')

      // 显示结果
      Text(this.resultText)
        .fontSize(16)
        .fontColor(Color.Green)
        .margin({ bottom: 15 })
        .id('text_result_0070')
        .textAlign(TextAlign.Center)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }

  // 添加带层级的overlay
  addOverlayWithLevel(level: number): void {
    try {
      // 如果已有overlay，先移除
      if (this.overlayContent !== null) {
        this.overlayManager.removeComponentContent(this.overlayContent)
      }

      // 创建新的overlay内容
      this.overlayContent = new ComponentContent(
        this.uiContext,
        wrapBuilder<[string]>(overlayContentBuilder),
        `Overlay Level: ${level}`
      )

      // 添加overlay
      this.overlayManager.addComponentContent(this.overlayContent, level)
      this.hasOverlay = true
    } catch (e) {
      const error = e as Error
      console.error('addOverlayWithLevel error: ' + error.message)
    }
  }

  aboutToDisappear(): void {
    // 清理overlay
    if (this.overlayContent !== null) {
      try {
        this.overlayManager.removeComponentContent(this.overlayContent)
      } catch (e) {
        const error = e as Error
        console.error('removeComponentContent error: ' + error.message)
      }
    }
  }
}

