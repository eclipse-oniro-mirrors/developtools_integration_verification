/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { pointer } from '@kit.InputKit';

@Entry
@Component
struct UiComponentUiContextAddMenuFocus06 {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: SearchController = new SearchController()

  build() {
    Column({space: 10}) {
      Text('onSubmit:' + this.submitValue)
        .fontSize(18)
        .margin(15)
      Text('onChange:' + this.changeValue)
        .fontSize(18)
        .margin(15)
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .id('UiComponentUiContextAddMenuFocus06')
        .onHover((flag) => {
          if (flag) {
            cursorControl.setCursor(pointer.PointerStyle.HELP)
          } else {
            cursorControl.restoreDefault()
          }
        })
        .margin(20)
      Button('Set caretPosition 1')
        .onClick(() => {
          this.controller.caretPosition(1)
        })
        .fontSize(10)
        .height(100)
        .backgroundColor(0x317aff)
        .width('90%')
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 2,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
      Button('Get CaretOffset')
        .onClick(() => {
          this.positionInfo = this.controller.getCaretOffset()
        })
        .fontSize(10)
        .height(100)
        .backgroundColor(0x317aff)
        .width('90%')
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 2,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
    }
    .width('100%')
  }
}