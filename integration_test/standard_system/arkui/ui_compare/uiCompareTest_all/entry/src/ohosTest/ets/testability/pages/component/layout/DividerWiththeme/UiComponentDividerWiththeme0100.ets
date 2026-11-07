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

/**
 * 设置divider的color，WithTheme下嵌套divider，动态切换WithTheme颜色
 * SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0100
 */
@Entry
@ComponentV2
export struct UiComponentDividerWiththeme0100 {
  @Local themeColor: string = '#FF0000';

  build() {
    Column() {
      Text('设置divider的color，WithTheme下嵌套divider，动态切换WithTheme颜色')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .textAlign(TextAlign.Center)

      Text('SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0100')
        .fontSize(12)
        .fontColor('#666')
        .margin({ bottom: 20 })
        .id('btn')

      WithTheme({ theme: { colors: { brand: this.themeColor } } }) {
        Column() {
          Text('WithTheme区域')
            .fontSize(14)
            .margin(10)

          Divider()
            .color('#000000')
            .strokeWidth(5)
            .width('90%')
            .margin(10)

          Text(`主题颜色: ${this.themeColor}`)
            .fontSize(12)
            .margin(10)

          Text('Divider颜色: #000000 (固定)')
            .fontSize(12)
            .fontColor('#666')
            .margin(10)
        }
        .width('100%')
        .padding(20)
        .backgroundColor('#f5f5f5')
      }

      Button('切换主题颜色')
        .width('60%')
        .margin({ top: 20 })
        .onClick(() => {
          this.themeColor = this.themeColor === '#FF0000' ? '#00FF00' : '#FF0000';
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
