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
struct UIAttributesInterfaceReconstitution002 {
  @State message: string = 'translate值为undefined';
  private translateOptionsArr: Array<Optional<TranslateOptions>> = [{ x: undefined, y: undefined }, { x: 100, y: 100 }];
  @State index: number = 0;
  @State translateFlag: number = 0;

  build() {
    Column() {
      Row() {
        Text(this.message)
          .fontColor(Color.Black)
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('10%')

      Row() {
        Text('translate')
          .fontColor(0xCCCCCC)
          .padding(15)
          .fontSize(30)
          .translate(this.translateOptionsArr[this.index])
          .backgroundColor(0xAFEEEE)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('70%')

      Row() {
        Button('设置translate值')
          .id('setting')
          .stateEffect(true)
          .onClick(() => {
            this.translateFlag++;
            if(this.translateFlag % 2 == 1) {
              this.index = 1;
              this.message = 'translate值为正常值';
            } else {
              this.index = 0;
              this.message = 'translate值为undefined';
            }
          })
      }
      .justifyContent(FlexAlign.Center)
      .height('10%')
      .width('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}