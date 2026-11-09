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
struct UIAttributesInterfaceReconstitution017 {
  @State message: string = 'backgroundColor值为undefined';
  private backgroundColorArr: Array<ResourceColor | undefined> = [undefined, 0xAFEEEE];
  @State index: number = 0;
  @State backgroundColorFlag: number = 0;

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
        Text('backgroundColor')
          .fontColor(Color.Black)
          .padding(15)
          .fontSize(30)
      }
      .backgroundColor(this.backgroundColorArr[this.index])
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('70%')

      Row() {
        Button('设置backgroundColor值')
          .id('setting')
          .stateEffect(true)
          .onClick(() => {
            this.backgroundColorFlag++;
            if(this.backgroundColorFlag % 2 == 1) {
              this.index = 1;
              this.message = 'backgroundColor值为正常值';
            } else {
              this.index = 0;
              this.message = 'backgroundColor值为undefined';
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