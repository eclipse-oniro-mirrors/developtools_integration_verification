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
 * 在WithTheme下添加divider添加vertical属性
 * SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0010
 */
@Entry
@ComponentV2
export struct UiComponentDividerWiththeme0010 {
  @Local vertical: boolean = false;

  build() {
    Column() {
      Text('在WithTheme下添加divider添加vertical属性')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0010')
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 20 })
        .id('btn')

      WithTheme({ theme: { colors: { brand: '#FF0000' } } }) {
        Row() {
          Text('左侧')
            .fontSize(16)

          Divider()
            .vertical(this.vertical)
            .height(this.vertical ? 50 : undefined)
            .width(this.vertical ? undefined : 200)
            .margin(10)

          Text('右侧')
            .fontSize(16)
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .padding(20)
      }

      Button(`当前: ${this.vertical ? '垂直' : '水平'} - 点击切换`)
        .width('80%')
        .margin({ top: 20 })
        .onClick(() => {
          this.vertical = !this.vertical;
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
