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
 * 在WithTheme下添加divider添加lineCap属性
 * SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0030
 */
@Entry
@ComponentV2
export struct UiComponentDividerWiththeme0030 {
  @Local lineCap: LineCapStyle = LineCapStyle.Butt;

  build() {
    Column() {
      Text('在WithTheme下添加divider添加lineCap属性')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0030')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })
        .id('btn')

      WithTheme({ theme: { colors: { brand: '#FF0000' } } }) {
        Column() {
          Divider()
            .lineCap(this.lineCap)
            .strokeWidth(10)
            .width('90%')
            .margin(10)

          Text(`当前端点: ${this.lineCap === LineCapStyle.Butt ? 'Butt' : this.lineCap === LineCapStyle.Round ? 'Round' : 'Square'}`)
            .fontSize(14)
            .margin(10)
        }
        .width('100%')
        .padding(20)
      }

      Button('Butt')
        .width('30%')
        .margin(5)
        .onClick(() => { this.lineCap = LineCapStyle.Butt; })

      Button('Round')
        .width('30%')
        .margin(5)
        .onClick(() => { this.lineCap = LineCapStyle.Round; })

      Button('Square')
        .width('30%')
        .margin(5)
        .onClick(() => { this.lineCap = LineCapStyle.Square; })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
