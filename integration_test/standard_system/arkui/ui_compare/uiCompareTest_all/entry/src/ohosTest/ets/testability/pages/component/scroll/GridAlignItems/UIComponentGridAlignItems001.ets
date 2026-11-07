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
struct UIComponentGridAlignItems001 {
  @State numbers: string[] = [];
  @State columnsGap: number = 10;
  @State rowsGap: number = 10;
  private scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    for(let i: number = 0; i < 10; i++) {
      this.numbers.push(`${i + 1}`);
    }
  }

  build() {
      Column() {
        Column() {
          Text('alignItems设置STRETCH测试')
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .fontWeight(FontWeight.Bold)
            .fontStyle(FontStyle.Normal)
        }.justifyContent(FlexAlign.Center).height('10%')
        Grid(this.scroller) {
          GridItem() {
            Text('hello')
              .fontSize(20)
              .width('50%')
              .height('25%')
              .textAlign(TextAlign.Center)
          }.backgroundColor(0xF9CF93)
          GridItem() {
            Text('world')
              .fontSize(20)
              .width('50%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }.backgroundColor(0xF9CF93)
          ForEach(this.numbers, (day: string) => {
            ForEach(this.numbers, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(20)
                  .width('50%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .height('90%')
        .alignItems(GridItemAlignment.STRETCH)
        .columnsTemplate('1fr 1fr')
        .columnsGap(this.columnsGap)
        .rowsGap(this.rowsGap)
        .enableScrollInteraction(true)
        .supportAnimation(false)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Grey)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
    }.width('100%').height('90%').justifyContent(FlexAlign.Center)
  }
}