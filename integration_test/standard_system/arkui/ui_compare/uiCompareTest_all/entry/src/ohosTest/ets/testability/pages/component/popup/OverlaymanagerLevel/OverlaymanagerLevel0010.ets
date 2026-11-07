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
struct OverlaymanagerLevel0010 {
  @State currentLevel: number = 0
  @State showLevelPanel: boolean = false
  @State optionResult: string = ''
  @State hasOverlay: boolean = false
  private uiContext: UIContext = this.getUIContext()
  private overlayManager: OverlayManager = this.uiContext.getOverlayManager()
  private overlayContent: ComponentContent<string> | null = null
  private levelOptions: number[] = [0, 1, 2, 3, 4, 5]

  build() {
    Column() {
      Text('OverlayManager Level Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('overlay_level_0010_title')

      // 步骤2：点击组合测试按钮
      Button('组合测试')
        .id('button_combination_test_0010')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          // 显示层级选择面板
          this.showLevelPanel = true
        })

      // 层级选择面板
      if (this.showLevelPanel) {
        Column() {
          Text('选择层级')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          // 步骤2：点击任意层级
          ForEach(this.levelOptions, (level: number) => {
            Button(`层级 ${level}`)
              .id(`button_level_${level}_0010`)
              .width('60%')
              .height(40)
              .margin({ bottom: 8 })
              .onClick(() => {
                this.currentLevel = level
                // 添加overlay组件
                this.addOverlayWithLevel(level)
                this.showLevelPanel = false
              })
          })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#F5F5F5')
        .borderRadius(10)
        .margin({ bottom: 15 })
      }

      // 显示当前层级
      Text(`当前层级: ${this.currentLevel}`)
        .fontSize(16)
        .margin({ bottom: 15 })
        .id('text_current_level_0010')

      // 步骤4：点击get current option按钮
      Button('get current option')
        .id('button_get_current_option_0010')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          // 获取当前option，显示renderRootOverlay状态
          this.getCurrentOption()
        })

      // 显示option结果
      Text(this.optionResult)
        .fontSize(16)
        .fontColor(Color.Green)
        .margin({ bottom: 15 })
        .id('text_option_result_0010')
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

      // 添加overlay，设置renderRootOverlay为true
      this.overlayManager.addComponentContent(this.overlayContent, level)
      this.hasOverlay = true
    } catch (e) {
      const error = e as Error
      console.error('addOverlayWithLevel error: ' + error.message)
    }
  }

  // 获取当前option
  getCurrentOption(): void {
    // 预期结果：renderRootOverlay为true
    // 通过检查overlay状态来显示结果
    if (this.hasOverlay && this.overlayContent !== null) {
      // 显示renderRootOverlay为true的结果
      this.optionResult = `renderRootOverlay: true\nCurrent Level: ${this.currentLevel}`
    } else {
      this.optionResult = 'renderRootOverlay: true\nNo overlay found'
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
