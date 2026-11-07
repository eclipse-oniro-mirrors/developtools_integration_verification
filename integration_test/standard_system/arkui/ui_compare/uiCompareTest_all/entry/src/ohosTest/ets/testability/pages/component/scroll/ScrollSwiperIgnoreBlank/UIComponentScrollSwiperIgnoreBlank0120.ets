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

class MyDataSourceUIComponentScrollSwiperIgnoreBlank0120 implements IDataSource {
  private list: number[] = [];

  constructor(list: number[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): number {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct UIComponentScrollSwiperIgnoreBlank0120 {
  @State name: string = 'UIComponentScrollSwiperIgnoreBlank0120';
  @State message: string = this.name;
  @State loopValue: boolean = false;
  @State indexValue: number = 0;
  @State prevMarginFirstValue: Length = 10;
  @State prevMarginSecondValue: boolean = true;
  private swiperController: SwiperController = new SwiperController();
  private data: MyDataSourceUIComponentScrollSwiperIgnoreBlank0120 = new MyDataSourceUIComponentScrollSwiperIgnoreBlank0120([]);

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 0; i < 3; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceUIComponentScrollSwiperIgnoreBlank0120(list);
  }


  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Swiper(this.swiperController) {
        Text('Page 0')
          .width('100%')
          .height(160)
          .backgroundColor(Color.Blue)
          .fontSize(30)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Text('Page 1')
          .width('100%')
          .height(160)
          .backgroundColor(Color.Orange)
          .fontSize(30)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Text('Page 2')
          .width('100%')
          .height(160)
          .backgroundColor(Color.Green)
          .fontSize(30)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
      }
      .index(this.indexValue)
      .indicator(
        Indicator.digit()
        .top(200)
        .fontColor(Color.Gray)
        .selectedFontColor(Color.Gray)
        .digitFont({
          size: 20,
          weight: FontWeight.Bold
        })
        .selectedDigitFont({
          size: 20,
          weight: FontWeight.Normal
        })
      )
      .loop(this.loopValue)
      .duration(1000)
      .itemSpace(0)
      .displayArrow(true, false)
      .prevMargin(this.prevMarginFirstValue, this.prevMarginSecondValue)

      Row({ space: 12 }) {
        Button('showPrevious')
          .id(this.name + '_01')
          .borderRadius(20)
          .backgroundColor(0x317aff)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin(10)
          .onClick(() => {
            this.swiperController.showPrevious();
          })

        Button('showNext')
          .id(this.name + '_02')
          .borderRadius(20)
          .backgroundColor(0x317aff)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin(10)
          .onClick(() => {
            this.swiperController.showNext();
          })

      }
      .justifyContent(FlexAlign.Center)
      .width('80%')
      .margin(10)

      Button('get')
        .id(this.name + '_03')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          this.message = 'prevMargin: ' + this.prevMarginFirstValue.toString();
        })

      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
      
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
