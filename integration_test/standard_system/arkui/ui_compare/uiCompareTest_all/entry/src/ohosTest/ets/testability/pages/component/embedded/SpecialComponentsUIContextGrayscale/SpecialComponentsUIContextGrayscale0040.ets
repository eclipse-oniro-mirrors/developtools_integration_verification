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
struct SpecialComponentsUIContextGrayscale0040 {
  @State numbers: string[] = [];

  aboutToAppear() {
    for (let i = 1; i <= 30; i++) {
      this.numbers.push(i + '');
    }
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Blank()
        Text('rowsTemplate、columnsTemplate都不设置layoutDirection、maxCount、minCount、cellLength才生效')
          .fontSize(15).fontColor(0xCCCCCC).width('90%')
        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .height('24.59%')
        .columnsGap(10)
        .rowsGap(10)
        .backgroundColor(0xFAEEE0)
        .maxCount(6)
        .minCount(2)
        .cellLength(0)
        .layoutDirection(GridDirection.Row)
        .grayscale(-10)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(-1)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(0)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(0.2)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(0.5)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(0.8)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(1)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(1.5)

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('5.56%').height('6.56%').borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .grayscale(100)
      }
      .width('90%').margin({ top: 5, left: 5, right: 5 })
      .align(Alignment.Center)
    }
  }
}
