/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct UiComponentSearchAutoDisAble11 {
  controller: SearchController = new SearchController();
  @State inputValue: string = '';
  @State height1: string | number = '30%';
  @State supportAvoidance: boolean = true;
  @State submitValue: string = '';
  @State changeValue: string = '';
  @State color :Color =Color.Blue
  @State mysize :Length ='10px'

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
    }
    .backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      Text('onSubmit:' + this.submitValue)
        .margin(15)
        .fontSize(15)
        .fontColor(this.color)
        .width('90%')
        .height('10%')
      Text('onChange:' + this.changeValue)
        .fontSize(18)
        .margin(15)
        .width('90%')
        .height('10%')
      Row() {
        Button('30%')
          .fontSize(24)
          .onClick(() => {
            this.height1 = '30%';
          })
        Button('80%')
          .fontSize(24)
          .margin({ left: 20 })
          .onClick(() => {
            this.height1 = '80%';
          })
        Button('change size')
          .fontSize(24)
          .margin({ left: 20 })
          .onClick(() => {
            this.mysize='30px'
          })
          .id('UiComponentSearchAutoDisAble11_02')
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Bottom)
      .height(this.height1)
      .width('100%')
      .padding({ bottom: 50 })

      Search({ controller: this.controller, value: this.inputValue ,placeholder:'this is placeholder' })
        .customKeyboard(this.CustomKeyboardBuilder(), { supportAvoidance: this.supportAvoidance })
        .searchButton('搜索',
          { fontSize: this.mysize,
            fontColor:Color.Blue,
            autoDisable:true
          })
        .margin(10)
        .border({ width: 1 })
        .onChange((value: string) => {
          this.inputValue = value;
        })
        .onSubmit((value: string) => {
          this.submitValue = value;
          this.color=Color.Red
        })
        .id('UiComponentSearchAutoDisAble11')
    }
  }
}