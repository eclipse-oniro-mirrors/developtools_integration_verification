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
 * 在WithTheme下添加divider添加color属性
 * SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0040
 */
@Entry
@ComponentV2
export struct UiComponentDividerWiththeme0040 {
  @Local dividerColor: string = '#FF0000';

  build() {
    Column() {
      Text('在WithTheme下添加divider添加color属性')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0040')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })
        .id('btn')

      WithTheme({ theme: { colors: { brand: '#0000FF' } } }) {
        Column() {
          Divider()
            .color(this.dividerColor)
            .strokeWidth(5)
            .width('90%')
            .margin(10)

          Text(`Divider颜色: ${this.dividerColor}`)
            .fontSize(14)
            .margin(10)
        }
        .width('100%')
        .padding(20)
      }

      Button('红色')
        .width('30%')
        .margin(5)
        .onClick(() => { this.dividerColor = '#FF0000'; })

      Button('绿色')
        .width('30%')
        .margin(5)
        .onClick(() => { this.dividerColor = '#00FF00'; })

      Button('蓝色')
        .width('30%')
        .margin(5)
        .onClick(() => { this.dividerColor = '#0000FF'; })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
