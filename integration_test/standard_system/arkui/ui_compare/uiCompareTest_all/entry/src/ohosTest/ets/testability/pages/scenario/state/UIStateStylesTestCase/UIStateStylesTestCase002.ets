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
struct StateStylesDemo {
  @State isDisabled: boolean = false
  @State focusColor: Color = Color.Blue

  build() {
    Column({ space: 20 }) {
      // 测试按钮组件
      Button('Test Button')
        .size({ width: 200, height: 60 })
        .stateStyles({
          focused: {
            .backgroundColor(Color.Yellow)
          },
          pressed: {
            .backgroundColor(Color.Black)
          },
          normal: {
            .backgroundColor(this.focusColor)
          },
          disabled: {
            .backgroundColor(Color.Yellow)
          }
        })
        .enabled(!this.isDisabled)
        .onFocus(() => {
          this.focusColor = Color.Pink
        })
        .onBlur(() => {
          this.focusColor = Color.Blue
        })
        .onClick(() => {
          console.log('Test Button Clicked')
        })

      // 控制按钮
      Button('Toggle Disable')
        .onClick(() => {
          this.isDisabled = !this.isDisabled
          if (!this.isDisabled) {
            setTimeout(() => {
              focusControl.requestFocus('testBtn')
            }, 100)
          }
        })
        .id('toggleBtn')
    }
    .padding(20)
    .width('100%')
  }
}