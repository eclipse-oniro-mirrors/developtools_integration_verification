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
struct UIAttributesInterfaceReconstitution009 {
  @State message: string = 'rotate值为undefined';
  private rotateOptionsArr: Array<Optional<RotateOptions>> = [undefined,
    {
      x: 0,
      y: 0,
      z: 1,
      centerX: '50%',
      centerY: '50%',
      angle: 270
    }];
  @State index: number = 0;
  @State rotateFlag: number = 0;

  build() {
    Column() {
      Row() {
        Text(this.message)
          .fontColor(Color.Black)
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .height('10%')
      .width('90%')

      Row() {
        Text('rotate')
          .fontColor(0xCCCCCC)
          .padding(15)
          .fontSize(30)
          .rotate(this.rotateOptionsArr[this.index])
          .backgroundColor(0xAFEEEE)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('70%')

      Row() {
        Button('设置rotate值')
          .id('setting')
          .stateEffect(true)
          .onClick(() => {
            this.rotateFlag++;
            if(this.rotateFlag % 2 == 1) {
              this.index = 1;
              this.message = 'rotate值为正常值';
            } else {
              this.index = 0;
              this.message = 'rotate值为undefined';
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