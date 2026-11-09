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
import { matrix4 } from '@kit.ArkUI';

@Entry
@Component
struct UIAttributesInterfaceReconstitution003 {
  @State message: string = 'transform值为undefined';
  private objectArr: Array<Optional<object>> = [undefined,
    matrix4.identity().translate({ x: 50, y: 50 }).scale({ x: 1.5, y: 1 }).rotate({
      x: 0,
      y: 0,
      z: 1,
      angle: 60
    })];
  @State index: number = 0;
  @State transformFlag: number = 0;

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
        Text('transform')
          .fontColor(0xCCCCCC)
          .padding(15)
          .fontSize(30)
          .transform(this.objectArr[this.index])
          .backgroundColor(0xAFEEEE)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('70%')

      Row() {
        Button('设置transform值')
          .id('setting')
          .stateEffect(true)
          .onClick(() => {
            this.transformFlag++;
            if(this.transformFlag % 2 == 1) {
              this.index = 1;
              this.message = 'transform值为正常值';
            } else {
              this.index = 0;
              this.message = 'transform值为undefined';
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