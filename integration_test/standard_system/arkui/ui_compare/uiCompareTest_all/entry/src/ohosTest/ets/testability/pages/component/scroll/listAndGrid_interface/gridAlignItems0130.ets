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
 * GridAlignItems0130
 * 
 * repeat加载GridItem场景下，测试alignItems属性
 */

@Entry
@Component
export struct GridAlignItems0130 {
  @State numbers: number[] = [];

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Grid() {
        Repeat<number>(this.numbers)
          .each((ri: RepeatItem<number>) => {
            GridItem() {
              Column() {
                Column()
                  .height('4.1%')
                  .width('100%')
                  .backgroundColor('#D5D5D5')
                
                Text('这是一段文字。'.repeat(Math.floor(Math.random() * 5) + 1))
                  .flexGrow(1)
                  .width('100%')
                  .align(Alignment.TopStart)
                  .backgroundColor('#F7F7F7')
                
                Column()
                  .height('2.46%')
                  .width('100%')
                  .backgroundColor('#707070')
              }
            }
            .border({ color: Color.Black, width: 1 })
          })
          .key((item: number) => item.toString())
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .alignItems(GridItemAlignment.STRETCH)
      .width('80%')
      .height('100%')
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
  }
}

