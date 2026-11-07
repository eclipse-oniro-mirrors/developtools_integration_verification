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
struct UIAttributesInterfaceReconstitution039 {
  @State message: string = 'grayscale值为undefined';
  private grayscaleArr: Array<Optional<number>> = [undefined, 0.5, 88.0];
  @State index: number = 0;

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
        Text('grayscale')
          .fontColor(Color.Black)
          .padding(15)
          .fontSize(30)
          .backgroundColor(0xAFEEEE)
          .grayscale(this.grayscaleArr[this.index])
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('60%')

      Row() {
        Button('设置grayscale值为正常值')
          .id('normal')
          .stateEffect(true)
          .onClick(() => {
            this.index = 1;
            this.message = 'grayscale值为正常值';
          })
          .margin(10)
      }
      .justifyContent(FlexAlign.Center)
      .height('10%')
      .width('90%')

      Row() {
        Button('设置grayscale值为异常值')
          .id('abnormal')
          .stateEffect(true)
          .onClick(() => {
            this.index = 2;
            this.message = 'grayscale值为异常值';
          })
          .margin(10)
      }
      .justifyContent(FlexAlign.Center)
      .height('10%')
      .width('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}