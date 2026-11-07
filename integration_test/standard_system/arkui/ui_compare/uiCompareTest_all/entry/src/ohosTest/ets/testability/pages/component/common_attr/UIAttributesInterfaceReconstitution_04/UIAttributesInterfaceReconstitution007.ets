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
struct UIAttributesInterfaceReconstitution007 {
  @State message: string = 'opacity值为undefined';
  private opacityArr: Array<number | undefined> = [undefined, 0.5, -1];
  @State index: number = 0;
  @State opacityFlag: number = 0;

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
        Text('opacity')
          .fontColor(0xCCCCCC)
          .padding(15)
          .fontSize(30)
          .opacity(this.opacityArr[this.index])
          .backgroundColor(0xAFEEEE)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('70%')

      Row() {
        Button('opacity设为正常值')
          .id('normal')
          .stateEffect(true)
          .onClick(() => {
            this.index = 1;
            this.message = 'opacity值为正常值';
          })
        Button('opacity设为异常值')
          .id('abnormal')
          .stateEffect(true)
          .onClick(() => {
            this.index = 2;
            this.message = 'opacity值为异常值';
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