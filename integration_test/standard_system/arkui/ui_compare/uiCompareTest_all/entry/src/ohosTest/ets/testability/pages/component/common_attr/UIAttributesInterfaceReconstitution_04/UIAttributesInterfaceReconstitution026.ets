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
struct UIAttributesInterfaceReconstitution026 {
  @State message: string = 'foregroundBlurStyle值为undefined';
  private foregroundBlurStyleArr: Array<Optional<BlurStyle>> = [undefined, BlurStyle.Thin];
  @State index: number = 0;
  @State foregroundBlurStyleFlag: number = 0;

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
        Text('foregroundBlurStyle')
          .fontColor(0xAAAAAA)
          .padding(15)
          .fontSize(30)
          .foregroundBlurStyle(this.foregroundBlurStyleArr[this.index])
          .backgroundImage('/closeeye.png', ImageRepeat.X)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('70%')

      Row() {
        Button('设置foregroundBlurStyle值')
          .id('setting')
          .stateEffect(true)
          .onClick(() => {
            this.foregroundBlurStyleFlag++;
            if(this.foregroundBlurStyleFlag % 2 == 1) {
              this.index = 1;
              this.message = 'foregroundBlurStyle值为正常值';
            } else {
              this.index = 0;
              this.message = 'foregroundBlurStyle值为undefined';
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