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
struct UIAttributesInterfaceReconstitution016 {
  @State message: string = 'clip值为undefined';
  private clipArr: Array<Optional<boolean>> = [undefined, true];
  @State index: number = 0;
  @State clipShapeFlag: number = 0;

  build() {
    Column() {
      Row() {
        Text(this.message)
          .fontColor(Color.Black)
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')

      Row() {
        Text('clipShape')
          .fontColor(0xCCCCCC)
          .padding(15)
          .fontSize(30)
          .backgroundColor(0xAFEEE)
      }
      .justifyContent(FlexAlign.Center)
      .clip(this.clipArr[this.index])
      .borderRadius(20)

      Row() {
        Button('clip设为正常值')
          .id('setting')
          .stateEffect(true)
          .onClick(() => {
            this.index = 1;
            this.message = 'clip值为正常值';
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}