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
struct UIComponentAlphabetIndexerAttributeAutocollapse001 {
  @State message: string = 'Hello';
  @State selectedIndex: number = 0;
  private arrayA: string[] = ['安'];
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙'];
  private arrayC: string[] = ['曹', '成', '陈', '催'];
  private arrayK: string[] = ['孔', '柯', '康', '邝', '匡', '阚'];
  private arr1: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F'];
  private arr2: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'];
  private arr3: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'];

  build() {
    Column() {
      Row() {
        Column() {
          Row() {
            Column() {
              Column() {
                Text('所有字符数≤9').fontSize(15)
              }
              Column() {
                Stack({ alignContent: Alignment.Start }) {
                  Row() {
                    List({ space: 20, initialIndex: 0 }) {
                      ForEach(this.arrayA, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayB, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayC, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayK, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)
                    }.width('20%').height('80%')

                    AlphabetIndexer({ arrayValue: this.arr1, selected: $$this.selectedIndex })
                      .height('100%')
                      .autoCollapse(true)
                      .enableHapticFeedback(true)
                      .selectedColor(0xFFFFFF)
                      .popupColor(0xFFFAF0)
                      .selectedBackgroundColor(0xCCCCCC)
                      .popupBackground(0xD2B48C)
                      .usingPopup(true)
                      .selectedFont({ size: 28, weight: FontWeight.Bolder })
                      .popupFont({ size: 25, weight: FontWeight.Bolder })
                      .itemSize(30)
                      .alignStyle(IndexerAlign.Right)
                      .popupItemBorderRadius(24)
                      .itemBorderRadius(14)
                      .popupBackgroundBlurStyle(BlurStyle.NONE)
                      .popupTitleBackground(0xCCCCCC)
                      .popupSelectedColor(0x00FF00)
                      .popupUnselectedColor(0x0000FF)
                      .popupItemFont({ size: 25, style: FontStyle.Normal })
                      .popupItemBackgroundColor(0xCCCCCC)
                      .onSelect((index: number) => {
                        console.info(this.arr1[index] + ' Selected!')
                      })
                      .onRequestPopupData((index: number) => {
                        if (this.arr1[index] == 'A') {
                          return this.arrayA
                        } else if (this.arr1[index] == 'B') {
                          return this.arrayB
                        } else if (this.arr1[index] == 'C') {
                          return this.arrayC
                        } else if (this.arr1[index] == 'K') {
                          return this.arrayK
                        } else {
                          return []
                        }
                      })
                      .onPopupSelect((index: number) => {
                        console.info('onPopupSelected:' + index)
                      })
                  }
                }
              }
            }.width('50%')
            Column() {
              Column() {
                Text('9<所有字符数≤13 全显示').fontSize(15)
              }
              Column() {
                Stack({ alignContent: Alignment.Start }) {
                  Row() {
                    List({ space: 20, initialIndex: 0 }) {
                      ForEach(this.arrayA, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayB, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayC, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayK, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)
                    }.width('20%').height('80%')

                    AlphabetIndexer({ arrayValue: this.arr2, selected: $$this.selectedIndex })
                      .height('100%')
                      .autoCollapse(true)
                      .enableHapticFeedback(true)
                      .selectedColor(0xFFFFFF)
                      .popupColor(0xFFFAF0)
                      .selectedBackgroundColor(0xCCCCCC)
                      .popupBackground(0xD2B48C)
                      .usingPopup(true)
                      .selectedFont({ size: 15, weight: FontWeight.Bolder })
                      .popupFont({ size: 25, weight: FontWeight.Bolder })
                      .itemSize(15)
                      .alignStyle(IndexerAlign.Right)
                      .popupItemBorderRadius(24)
                      .itemBorderRadius(14)
                      .popupBackgroundBlurStyle(BlurStyle.NONE)
                      .popupTitleBackground(0xCCCCCC)
                      .popupSelectedColor(0x00FF00)
                      .popupUnselectedColor(0x0000FF)
                      .popupItemFont({ size: 25, style: FontStyle.Normal })
                      .popupItemBackgroundColor(0xCCCCCC)
                      .onSelect((index: number) => {
                        console.info(this.arr2[index] + ' Selected!')
                      })
                      .onRequestPopupData((index: number) => {
                        if (this.arr2[index] == 'A') {
                          return this.arrayA
                        } else if (this.arr2[index] == 'B') {
                          return this.arrayB
                        } else if (this.arr2[index] == 'C') {
                          return this.arrayC
                        } else if (this.arr2[index] == 'K') {
                          return this.arrayK
                        } else {
                          return []
                        }
                      })
                      .onPopupSelect((index: number) => {
                        console.info('onPopupSelected:' + index)
                      })
                  }
                }
              }
            }.width('50%')
          }.height('31%')
        }
      }
      Row() {
        Column() {
          Row() {
            Column() {
              Column() {
                Text('9<所有字符数≤13 短折叠').fontSize(15)
              }
              Column() {
                Stack({ alignContent: Alignment.Start }) {
                  Row() {
                    List({ space: 20, initialIndex: 0 }) {
                      ForEach(this.arrayA, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayB, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayC, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayK, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)
                    }.width('20%').height('80%')

                    AlphabetIndexer({ arrayValue: this.arr2, selected: $$this.selectedIndex })
                      .height('100%')
                      .autoCollapse(true)
                      .enableHapticFeedback(true)
                      .selectedColor(0xFFFFFF)
                      .popupColor(0xFFFAF0)
                      .selectedBackgroundColor(0xCCCCCC)
                      .popupBackground(0xD2B48C)
                      .usingPopup(true)
                      .selectedFont({ size: 28, weight: FontWeight.Bolder })
                      .popupFont({ size: 25, weight: FontWeight.Bolder })
                      .itemSize(30)
                      .alignStyle(IndexerAlign.Right)
                      .popupItemBorderRadius(24)
                      .itemBorderRadius(14)
                      .popupBackgroundBlurStyle(BlurStyle.NONE)
                      .popupTitleBackground(0xCCCCCC)
                      .popupSelectedColor(0x00FF00)
                      .popupUnselectedColor(0x0000FF)
                      .popupItemFont({ size: 25, style: FontStyle.Normal })
                      .popupItemBackgroundColor(0xCCCCCC)
                      .onSelect((index: number) => {
                        console.info(this.arr2[index] + ' Selected!')
                      })
                      .onRequestPopupData((index: number) => {
                        if (this.arr2[index] == 'A') {
                          return this.arrayA
                        } else if (this.arr2[index] == 'B') {
                          return this.arrayB
                        } else if (this.arr2[index] == 'C') {
                          return this.arrayC
                        } else if (this.arr2[index] == 'K') {
                          return this.arrayK
                        } else {
                          return []
                        }
                      })
                      .onPopupSelect((index: number) => {
                        console.info('onPopupSelected:' + index)
                      })
                  }
                }
              }
            }.width('50%')
            Column() {
              Column() {
                Text('所有字符数>13 短折叠').fontSize(15)
              }
              Column() {
                Stack({ alignContent: Alignment.Start }) {
                  Row() {
                    List({ space: 20, initialIndex: 0 }) {
                      ForEach(this.arrayA, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayB, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayC, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayK, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)
                    }.width('20%').height('80%')

                    AlphabetIndexer({ arrayValue: this.arr3, selected: $$this.selectedIndex })
                      .height('100%')
                      .autoCollapse(true)
                      .enableHapticFeedback(true)
                      .selectedColor(0xFFFFFF)
                      .popupColor(0xFFFAF0)
                      .selectedBackgroundColor(0xCCCCCC)
                      .popupBackground(0xD2B48C)
                      .usingPopup(true)
                      .selectedFont({ size: 28, weight: FontWeight.Bolder })
                      .popupFont({ size: 25, weight: FontWeight.Bolder })
                      .itemSize(30)
                      .alignStyle(IndexerAlign.Right)
                      .popupItemBorderRadius(24)
                      .itemBorderRadius(14)
                      .popupBackgroundBlurStyle(BlurStyle.NONE)
                      .popupTitleBackground(0xCCCCCC)
                      .popupSelectedColor(0x00FF00)
                      .popupUnselectedColor(0x0000FF)
                      .popupItemFont({ size: 25, style: FontStyle.Normal })
                      .popupItemBackgroundColor(0xCCCCCC)
                      .onSelect((index: number) => {
                        console.info(this.arr3[index] + ' Selected!')
                      })
                      .onRequestPopupData((index: number) => {
                        if (this.arr3[index] == 'A') {
                          return this.arrayA
                        } else if (this.arr3[index] == 'B') {
                          return this.arrayB
                        } else if (this.arr3[index] == 'C') {
                          return this.arrayC
                        } else if (this.arr3[index] == 'K') {
                          return this.arrayK
                        } else {
                          return []
                        }
                      })
                      .onPopupSelect((index: number) => {
                        console.info('onPopupSelected:' + index)
                      })
                  }
                }
              }
            }.width('50%')
          }.height('31%')
        }
      }
      Row() {
        Column() {
          Row() {
            Column() {
              Column() {
                Text('所有字符数>13 长折叠').fontSize(15)
              }
              Column() {
                Stack({ alignContent: Alignment.Start }) {
                  Row() {
                    List({ space: 20, initialIndex: 0 }) {
                      ForEach(this.arrayA, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayB, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayC, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)

                      ForEach(this.arrayK, (item: string) => {
                        ListItem() {
                          Text(item)
                            .width('80%')
                            .height(10)
                            .fontSize(15)
                            .textAlign(TextAlign.Center)
                        }
                      }, (item: string) => item)
                    }.width('20%').height('80%')

                    AlphabetIndexer({ arrayValue: this.arr3, selected: $$this.selectedIndex })
                      .height('100%')
                      .autoCollapse(true)
                      .enableHapticFeedback(true)
                      .selectedColor(0xFFFFFF)
                      .popupColor(0xFFFAF0)
                      .selectedBackgroundColor(0xCCCCCC)
                      .popupBackground(0xD2B48C)
                      .usingPopup(true)
                      .selectedFont({ size: 15, weight: FontWeight.Bolder })
                      .popupFont({ size: 25, weight: FontWeight.Bolder })
                      .itemSize(17)
                      .alignStyle(IndexerAlign.Right)
                      .popupItemBorderRadius(24)
                      .itemBorderRadius(14)
                      .popupBackgroundBlurStyle(BlurStyle.NONE)
                      .popupTitleBackground(0xCCCCCC)
                      .popupSelectedColor(0x00FF00)
                      .popupUnselectedColor(0x0000FF)
                      .popupItemFont({ size: 25, style: FontStyle.Normal })
                      .popupItemBackgroundColor(0xCCCCCC)
                      .onSelect((index: number) => {
                        console.info(this.arr3[index] + ' Selected!')
                      })
                      .onRequestPopupData((index: number) => {
                        if (this.arr3[index] == 'A') {
                          return this.arrayA
                        } else if (this.arr3[index] == 'B') {
                          return this.arrayB
                        } else if (this.arr3[index] == 'C') {
                          return this.arrayC
                        } else if (this.arr3[index] == 'K') {
                          return this.arrayK
                        } else {
                          return []
                        }
                      })
                      .onPopupSelect((index: number) => {
                        console.info('onPopupSelected:' + index)
                      })
                  }
                }
              }
            }.width('50%')
          }.height('31%')
        }
      }

    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}