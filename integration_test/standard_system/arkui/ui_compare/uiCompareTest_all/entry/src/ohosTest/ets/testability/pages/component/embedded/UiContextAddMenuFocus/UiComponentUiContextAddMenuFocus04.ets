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
struct UiComponentUiContextAddMenuFocus04 {
  controller: TextAreaController = new TextAreaController();
  @State inputValue: string = '';
  @State height1: string | number = '50%';
  @State height2: number = 100;
  @State supportAvoidance: boolean = true;

  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Row() {
        Button('x').onClick(() => {
          this.controller.stopEditing();
        }).margin(10)
      }

      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110).onClick(() => {
              this.inputValue += item;
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      Row() {
        Button('20%')
          .fontSize(10)
          .height(100)
          .backgroundColor(0x317aff)
          .width('30%')
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
          .onClick(() => {
            this.height1 = '20%';
          })
        Button('80%')
          .fontSize(10)
          .height(100)
          .backgroundColor(0x317aff)
          .width('30%')
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
          .onClick(() => {
            this.height1 = '80%';
          })
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Bottom)
      .height(this.height1)
      .width('100%')
      .padding({ bottom: 50 })

      TextArea({ controller: this.controller, text: this.inputValue })
        .height(100)
        .customKeyboard(this.CustomKeyboardBuilder(), { supportAvoidance: this.supportAvoidance })
        .margin(10)
        .border({ width: 1 })
        .id('UiComponentUiContextAddMenuFocus04')
        .onHover((flag) => {
          if (flag) {
            cursorControl.setCursor(pointer.PointerStyle.TEXT_CURSOR)
          } else {
            cursorControl.restoreDefault()
          }
        })
    }
  }
}