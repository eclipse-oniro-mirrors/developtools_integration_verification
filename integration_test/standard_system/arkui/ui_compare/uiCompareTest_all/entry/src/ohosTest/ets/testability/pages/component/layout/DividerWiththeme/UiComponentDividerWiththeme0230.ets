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
 * WithTheme1嵌套两个WithTheme2，两个WithTheme2下分别嵌套两个WithTheme3，WithTheme3下分别嵌套三个WithTheme4，每个WithTheme下分别设置不带颜色的divider，动态切换三个WithTheme4颜色
 * SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0230
 */
@Entry
@ComponentV2
export struct UiComponentDividerWiththeme0230 {
  @Local theme1Color: string = '#FF0000';
  @Local theme2Color: string = '#00FF00';
  @Local theme3Color: string = '#0000FF';
  @Local theme4Color: string = '#FFFF00';

  build() {
    Scroll() {
      Column() {
        Text('WithTheme1嵌套两个WithTheme2，两个WithTheme2下分别嵌套两个WithTheme3，WithTheme3下分别嵌套三个WithTheme4，每个WithTheme下分别设置不带颜色的divider，动态切换三个WithTheme4颜色')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })

        Text('SUB_ACE_UI_COMPONENT_DIVIDER_WITHTHEME_0230')
          .fontSize(8)
          .fontColor('#666')
          .margin({ bottom: 5 })
          .id('btn')

        WithTheme({ theme: { colors: { brand: this.theme1Color } } }) {
          Column() {
            Text('Theme1')
              .fontSize(10)
            Divider()
              .strokeWidth(2)
              .margin(3)

            WithTheme({ theme: { colors: { brand: this.theme2Color } } }) {
              Column() {
                Text('Theme2')
                  .fontSize(10)
                Divider()
                  .strokeWidth(2)
                  .margin(3)

                WithTheme({ theme: { colors: { brand: this.theme3Color } } }) {
                  Column() {
                    Text('Theme3')
                      .fontSize(10)
                    Divider()
                      .strokeWidth(2)
                      .margin(3)

                    WithTheme({ theme: { colors: { brand: this.theme4Color } } }) {
                      Column() {
                        Text('Theme4')
                          .fontSize(10)
                        Divider()
                          .strokeWidth(2)
                          .margin(3)
                      }
                      .padding(5)
                      .backgroundColor('#fff0f0')
                    }
                  }
                  .padding(5)
                  .backgroundColor('#f0fff0')
                }
              }
              .padding(5)
              .backgroundColor('#f0f0ff')
            }
          }
          .padding(5)
          .backgroundColor('#fffff0')
        }

        Row() {
          Button('T1')
            .fontSize(10)
            .width('23%')
            .onClick(() => {
              this.theme1Color = this.theme1Color === '#FF0000' ? '#AA0000' : '#FF0000';
            })
          Button('T2')
            .fontSize(10)
            .width('23%')
            .onClick(() => {
              this.theme2Color = this.theme2Color === '#00FF00' ? '#00AA00' : '#00FF00';
            })
          Button('T3')
            .fontSize(10)
            .width('23%')
            .onClick(() => {
              this.theme3Color = this.theme3Color === '#0000FF' ? '#0000AA' : '#0000FF';
            })
          Button('T4')
            .fontSize(10)
            .width('23%')
            .onClick(() => {
              this.theme4Color = this.theme4Color === '#FFFF00' ? '#AAAA00' : '#FFFF00';
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: 5 })

        Text('注：Divider随最近的WithTheme变化')
          .fontSize(8)
          .fontColor('#999')
          .margin({ top: 5 })
      }
      .width('100%')
      .padding(5)
    }
    .width('100%')
    .height('100%')
  }
}
