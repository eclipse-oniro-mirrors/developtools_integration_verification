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
struct SelectFuzzy11 {
  @State selectedOptionBgColor: ResourceColor = Color.Transparent;
  @State selectedIndex: number = 0;
  @State selectValue: string = '请选择';

  build() {
    Column() {
      Text('Select模糊测试 - selectedOptionBgColor设置为Color.Red')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 主Select组件
      Select([
        { value: '选项1', icon: $r('app.media.icon') },
        { value: '选项2', icon: $r('app.media.icon') },
        { value: '选项3', icon: $r('app.media.icon') }
      ])
        .id('select_fuzzy_11')
        .selected(this.selectedIndex)
        .value(this.selectValue)
        .selectedOptionBgColor(this.selectedOptionBgColor)
        .menuBackgroundBlurStyle(BlurStyle.COMPONENT_ULTRA_THICK)
        .onSelect((index: number, value: string) => {
          this.selectedIndex = index;
          this.selectValue = value;
        })
        .margin({ bottom: 20 })

      // 背景色控制
      Column({ space: 15 }) {
        Text('选中项背景色控制:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
        
        Row({ space: 10 }) {
          Button('Red')
            .id('selectedOptionBgColor_red_11')
            .onClick(() => {
              this.selectedOptionBgColor = Color.Red;
            })
          
          Button('Green')
            .id('selectedOptionBgColor_green_11')
            .onClick(() => {
              this.selectedOptionBgColor = Color.Green;
            })
        }
        
        Row({ space: 10 }) {
          Button('Blue')
            .id('selectedOptionBgColor_blue_11')
            .onClick(() => {
              this.selectedOptionBgColor = Color.Blue;
            })
          
          Button('Transparent')
            .id('selectedOptionBgColor_transparent_11')
            .onClick(() => {
              this.selectedOptionBgColor = Color.Transparent;
            })
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F0F2F5')
  }
}
