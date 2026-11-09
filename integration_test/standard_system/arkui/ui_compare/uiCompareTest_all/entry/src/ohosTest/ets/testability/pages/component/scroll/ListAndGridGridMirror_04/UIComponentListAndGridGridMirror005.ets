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
struct UIComponentListAndGridGridMirror005 {
  @State message: string = 'Grid组件 设置Gap 设置Direction为Ltr';
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'];
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontColor(Color.Black)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Normal)
      }.height('10%')
      Column() {
        Grid(this.scroller) {
          ForEach(this.arr, (day: string) => {
            ForEach(this.arr, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(20)
                  .width('30%')
                  .height('20%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .enableScrollInteraction(true)
        .supportAnimation(false)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Grey)
        .scrollBarWidth(10)
        .backgroundColor(0xDCDCDC)
        .width('100%')
        .height('100%')
        .direction(Direction.Ltr)
      }.width('100%').height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('95%')
  }
}