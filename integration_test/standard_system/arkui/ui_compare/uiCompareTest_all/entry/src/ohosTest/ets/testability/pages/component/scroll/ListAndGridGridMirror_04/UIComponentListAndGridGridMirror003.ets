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

@Entry
@Component
struct UIComponentListAndGridGridMirror003 {
  @State message: string = 'Hello';
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'];
  private layoutOptions: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [0, 6],
  }

  build() {
    Row() {
      Column() {
        Text('不设置direction')
          .fontSize(20)
          .fontColor(Color.Blue)
          .margin({ top: 20 })
          .height('10%')
          .key('UIComponentListAndGridGridMirror003_001')
        Grid(undefined, this.layoutOptions) {
          ForEach(this.arr, (day: string) => {
            ForEach(this.arr, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height(80)
                  .textAlign(TextAlign.Center)
              }.selectable(false)
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .enableScrollInteraction(true)
        .supportAnimation(false)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Grey)
        .scrollBarWidth(10)
        .backgroundColor(0xDCDCDC)
        .width('100%')
        .height('85%')
        .columnsTemplate('1fr 2fr')
        .layoutDirection(GridDirection.Row)
      }
      .width('48%')
      .height('100%')
      Column() {}
      .width('4%')
      Column() {
        Text('设置direction')
          .fontSize(20)
          .fontColor(Color.Blue)
          .margin({ top: 20 })
          .height('10%')
          .key('UIComponentListAndGridGridMirror003_002')
        Grid(undefined, this.layoutOptions) {
          ForEach(this.arr, (day: string) => {
            ForEach(this.arr, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height(80)
                  .textAlign(TextAlign.Center)
              }.selectable(false)
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .enableScrollInteraction(true)
        .supportAnimation(false)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Grey)
        .scrollBarWidth(10)
        .backgroundColor(0xDCDCDC)
        .width('100%')
        .height('85%')
        .columnsTemplate('1fr 2fr')
        .layoutDirection(GridDirection.Row)
        .direction(Direction.Ltr)
      }
      .width('48%')
      .height('100%')
    }
  }
}