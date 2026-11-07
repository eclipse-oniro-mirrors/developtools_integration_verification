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

// 自定义Overlay内容组件（带偏移）
@Builder
function overlayContentBuilder(text: string) {
  Column() {
    Text(text)
      .fontSize(20)
      .fontColor(Color.White)
      .padding(10)
  }
  .width('40%')
  .height('100%')
  .backgroundColor(Color.Blue)
  .borderRadius(10)
  .justifyContent(FlexAlign.Center)
  .position({ x: '55%', y: '5%' }) // 右上角位置
}

@Entry
@Component
struct OverlaymanagerLevel0100 {
  @State currentLevel: string = 'undefined'
  @State hasOverlay: boolean = false
  @State resultText: string = ''
  private uiContext: UIContext = this.getUIContext()
  private overlayManager: OverlayManager = this.uiContext.getOverlayManager()
  private overlayContent: ComponentContent<string> | null = null

  build() {
    Column() {
      Text('OverlayManager Level Test - 0100')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('overlay_level_0100_title')

      // 步骤3：点击undefined右上角按钮
      Button('undefined右上角')
        .id('button_undefined_topright_0100')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.currentLevel = 'undefined'
          this.addOverlayWithOffset()
        })

      // 显示当前层级
      Text(`当前层级: ${this.currentLevel}`)
        .fontSize(16)
        .margin({ bottom: 15 })
        .id('text_current_level_0100')

      // 显示结果
      Text(this.resultText)
        .fontSize(16)
        .fontColor(Color.Green)
        .margin({ bottom: 15 })
        .id('text_result_0100')
        .textAlign(TextAlign.Center)
        .width('90%')

      // 模拟键盘区域
      Column() {
        Text('模拟键盘区域')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .width('100%')
      .height('16.39%')
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.Center)
      .position({ x: 0, y: '70%' })
      .id('keyboard_area_0100')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }

  // 添加带偏移的overlay
  addOverlayWithOffset(): void {
    try {
      // 如果已有overlay，先移除
      if (this.overlayContent !== null) {
        this.overlayManager.removeComponentContent(this.overlayContent)
      }

      // 创建新的overlay内容（右上角位置）
      this.overlayContent = new ComponentContent(
        this.uiContext,
        wrapBuilder<[string]>(overlayContentBuilder),
        `Overlay 右上角`
      )

      // 添加overlay，不传层级参数（undefined）
      this.overlayManager.addComponentContent(this.overlayContent)
      this.hasOverlay = true
      this.resultText = 'overlay弹窗不会覆盖在键盘之上'
    } catch (e) {
      const error = e as Error
      console.error('addOverlayWithOffset error: ' + error.message)
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

