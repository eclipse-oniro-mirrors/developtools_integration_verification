/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct KeyboardStateDemo {
  @State isDisabled: boolean = false
  @State isFocused: boolean = false
  @State isPressed: boolean = false

  build() {
    Column() {
      // 测试按钮
      Button('Test Button')
        .width(200)
        .height(60)
        .backgroundColor(this.getButtonColor())
        .onClick(() => this.isPressed = true)
        .focusable(true)
        .focusOnTouch(true)
        .onFocus(() => this.isFocused = true)
        .onBlur(() => this.isFocused = false)
        .onTouch((event?: TouchEvent) => {
          if (event) {
            if (event.type === TouchType.Down) {
              this.isPressed = true
            }
            if (event.type === TouchType.Up) {
              this.isPressed = false
            }
          }
        })
        .enabled(!this.isDisabled)

      Divider().margin(20)

      // 控制按钮
      Button(this.isDisabled ? 'Enable Button' : 'Disable Button')
        .width(200)
        .height(60)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
    .onClick(() => {
      this.isFocused = false // 点击其他区域失焦
    })
  }

  private getButtonColor(): ResourceColor {
    if (this.isDisabled) {
      return Color.Yellow // 禁用状态
    }
    if (this.isPressed) {
      return Color.Black // 按压状态
    }
    if (this.isFocused) {
      return Color.Pink  // 聚焦状态
    }
    return Color.Blue     // 默认状态
  }
}