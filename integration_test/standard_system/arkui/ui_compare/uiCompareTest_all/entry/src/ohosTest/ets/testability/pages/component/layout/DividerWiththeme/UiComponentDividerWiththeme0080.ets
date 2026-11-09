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
 * 不设置divider的color，父WithTheme下嵌套两个子WithTheme，子WithTheme分别嵌套divider，先动态切换两个子WithTheme颜色，再次动态切换父WithTheme颜色
 * SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0080
 */
@Entry
@ComponentV2
export struct UiComponentDividerWiththeme0080 {
  @Local parentColor: string = '#FF0000';
  @Local child1Color: string = '#00FF00';
  @Local child2Color: string = '#0000FF';

  build() {
    Column() {
      Text('不设置divider的color，父WithTheme下嵌套两个子WithTheme，子WithTheme分别嵌套divider，先动态切换两个子WithTheme颜色，再次动态切换父WithTheme颜色')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .textAlign(TextAlign.Center)

      Text('SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0080')
        .fontSize(10)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .id('btn')

      WithTheme({ theme: { colors: { brand: this.parentColor } } }) {
        Column() {
          Text('父WithTheme')
            .fontSize(14)
            .margin(5)

          Divider()
            .strokeWidth(3)
            .width('100%')
            .margin(5)

          Row() {
            WithTheme({ theme: { colors: { brand: this.child1Color } } }) {
              Column() {
                Text('子1')
                  .fontSize(12)
                Divider()
                  .strokeWidth(3)
                  .margin(5)
              }
              .width('45%')
              .padding(10)
              .backgroundColor('#ffe5e5')
            }

            WithTheme({ theme: { colors: { brand: this.child2Color } } }) {
              Column() {
                Text('子2')
                  .fontSize(12)
                Divider()
                  .strokeWidth(3)
                  .margin(5)
              }
              .width('45%')
              .padding(10)
              .backgroundColor('#e5e5ff')
            }
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#f5f5f5')
      }

      Row() {
        Button('父')
          .fontSize(12)
          .width('30%')
          .onClick(() => {
            this.parentColor = this.parentColor === '#FF0000' ? '#FFFF00' : '#FF0000';
          })

        Button('子1')
          .fontSize(12)
          .width('30%')
          .onClick(() => {
            this.child1Color = this.child1Color === '#00FF00' ? '#FF00FF' : '#00FF00';
          })

        Button('子2')
          .fontSize(12)
          .width('30%')
          .onClick(() => {
            this.child2Color = this.child2Color === '#0000FF' ? '#00FFFF' : '#0000FF';
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
