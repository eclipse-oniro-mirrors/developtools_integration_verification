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

@Entry
@Component
struct ToggleType18 {
  @State isOn: boolean = false;
  @State toggleEnabled: boolean = true;

  build() {
    Column({ space: 20 }) {
      Text('Toggle测试 - 未选中的button + changeEnable')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Button('changeEnable')
        .id('change_enable_18')
        .onClick(() => {
          this.toggleEnabled = !this.toggleEnabled;
        })

      Toggle({ type: ToggleType.Button, isOn: this.isOn }) {
        Text('status button')
          .fontColor(0x182431)
          .fontSize(12)
      }
        .id('toggle_button_18')
        .width(106)
        .selectedColor('rgba(0,125,255,0.20)')
        .enabled(this.toggleEnabled)
        .onChange((isOn: boolean) => {
          this.isOn = isOn;
        })

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
    .justifyContent(FlexAlign.Center)
  }
}

