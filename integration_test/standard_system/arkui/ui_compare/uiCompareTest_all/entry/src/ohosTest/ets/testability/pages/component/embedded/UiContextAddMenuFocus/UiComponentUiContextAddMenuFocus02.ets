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
struct UiComponentUiContextAddMenuFocus02 {
  @State text: string = 'setCursor PointerStyle to WEST';
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Text(this.text)
        .fontSize(15)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .maxLines(2)
        .fontColor(Color.Red)
        .fontStyle(FontStyle.Italic)
        .height(100)
      Row() {
        Button('UnFocusable')
          .onHover((flag) => {
            if (flag) {
              cursorControl.setCursor(pointer.PointerStyle.WEST)
            } else {
              cursorControl.restoreDefault()
            }
          })
          .id('UiComponentUiContextAddMenuFocus02_01')
      }
      .height('16.39%')
      .width('27.78%')
      .backgroundColor(Color.Green)
      .position({x: 200 ,y:300})
      Row() {
        Button('DefaultFocus')
          .onHover((flag) => {
            if (flag) {
              cursorControl.setCursor(pointer.PointerStyle.NORTH)
            } else {
              cursorControl.restoreDefault()
            }
          })
          .id('UiComponentUiContextAddMenuFocus02_02')
      }
      .height('16.39%')
      .width('27.78%')
      .backgroundColor(Color.Blue)
      .position({x: 0 ,y:300})
    }
    .width('100%')
  }
}
