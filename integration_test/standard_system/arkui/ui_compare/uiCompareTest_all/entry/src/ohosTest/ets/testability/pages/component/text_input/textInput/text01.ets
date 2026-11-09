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
struct Text01 {
  @State text: string = '11111111111\n                        \n           \n          \n       '
  controller: TextInputController = new TextInputController();
  @State textHeight:Length = 16
  @State textAlign:TextAlign = TextAlign.Start

  build() {
    Column() {
      Text(this.text)
        .id('Text01')
        .width('70%')
        .textAlign(this.textAlign)
        .lineHeight(this.textHeight)
        .height(100)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')

      Button('TextAlign.Start')
        .margin({top:30})
        .height(40)
        .id('Text01_01')
        .onClick( () => {
          this.textAlign = TextAlign.Start
        })


      Button('TextAlign.Center')
        .margin({top:30})
        .height(40)
        .id('Text01_02')
        .onClick( () => {
          this.textAlign = TextAlign.Center
        })

      Button('TextAlign.End')
        .margin({top:30})
        .height(40)
        .id('Text01_03')
        .onClick( () => {
          this.textAlign = TextAlign.End
        })

      Button('TextAlign.JUSTIFY')
        .margin({top:30})
        .height(40)
        .id('Text01_04')
        .onClick( () => {
          this.textAlign = TextAlign.JUSTIFY
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
