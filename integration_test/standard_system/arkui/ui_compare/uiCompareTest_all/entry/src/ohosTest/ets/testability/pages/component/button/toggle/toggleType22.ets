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
struct ToggleType22 {
  @State isOn: boolean = false;
  @State toggleType: ToggleType = ToggleType.Switch;

  build() {
    Column({ space: 20 }) {
      Text('Toggle测试 - changeType切换')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Button('changeType')
        .id('change_type_22')
        .onClick(() => {
          if (this.toggleType === ToggleType.Switch) {
            this.toggleType = ToggleType.Checkbox;
          } else if (this.toggleType === ToggleType.Checkbox) {
            this.toggleType = ToggleType.Button;
          } else {
            this.toggleType = ToggleType.Switch;
          }
        })

      if (this.toggleType === ToggleType.Switch) {
        Toggle({ type: ToggleType.Switch, isOn: this.isOn })
          .id('toggle_switch_22')
          .selectedColor(0x007DFF)
          .switchPointColor(0xFFFFFF)
          .onChange((isOn: boolean) => {
            this.isOn = isOn;
          })
      } else if (this.toggleType === ToggleType.Checkbox) {
        Toggle({ type: ToggleType.Checkbox, isOn: this.isOn })
          .id('toggle_checkbox_22')
          .size({ width: 20, height: 20 })
          .selectedColor(0x007DFF)
          .onChange((isOn: boolean) => {
            this.isOn = isOn;
          })
      } else {
        Toggle({ type: ToggleType.Button, isOn: this.isOn }) {
          Text('status button')
            .fontColor(0x182431)
            .fontSize(12)
        }
          .id('toggle_button_22')
          .width(106)
          .selectedColor('rgba(0,125,255,0.20)')
          .onChange((isOn: boolean) => {
            this.isOn = isOn;
          })
      }

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
    .justifyContent(FlexAlign.Center)
  }
}

