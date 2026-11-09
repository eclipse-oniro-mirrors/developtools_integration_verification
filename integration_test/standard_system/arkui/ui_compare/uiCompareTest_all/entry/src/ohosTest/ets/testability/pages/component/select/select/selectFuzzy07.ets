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
struct SelectFuzzy07 {
  @State blurStyle: BlurStyle | number = BlurStyle.COMPONENT_ULTRA_THICK;
  @State selectedIndex: number = 0;
  @State selectValue: string = '请选择';

  build() {
    Column() {
      Text('Select模糊测试 - BlurStyle设置为9999')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 主Select组件
      Select([
        { value: '选项1', icon: $r('app.media.icon') },
        { value: '选项2', icon: $r('app.media.icon') },
        { value: '选项3', icon: $r('app.media.icon') }
      ])
        .id('select_fuzzy_07')
        .selected(this.selectedIndex)
        .value(this.selectValue)
        .menuBackgroundBlurStyle(this.blurStyle as BlurStyle)
        .onSelect((index: number, value: string) => {
          this.selectedIndex = index;
          this.selectValue = value;
        })
        .margin({ bottom: 20 })

      // 模糊样式控制
      Column({ space: 15 }) {
        Text('模糊样式控制:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
        
        Row({ space: 10 }) {
          Button('NONE')
            .id('blurStyle_none_07')
            .onClick(() => {
              this.blurStyle = BlurStyle.NONE;
            })
          
          Button('BACKGROUND')
            .id('blurStyle_background_regular_07')
            .onClick(() => {
              this.blurStyle = BlurStyle.BACKGROUND_REGULAR;
            })
        }
        
        Row({ space: 10 }) {
          Button('THIN')
            .id('blurStyle_component_thin_07')
            .onClick(() => {
              this.blurStyle = BlurStyle.COMPONENT_THIN;
            })
          
          Button('9999')
            .id('blurStyle_large_07')
            .onClick(() => {
              this.blurStyle = 9999;
            })
        }
        
        Row({ space: 10 }) {
          Button('ULTRA_THICK')
            .id('blurStyle_component_ultra_thick_07')
            .onClick(() => {
              this.blurStyle = BlurStyle.COMPONENT_ULTRA_THICK;
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
