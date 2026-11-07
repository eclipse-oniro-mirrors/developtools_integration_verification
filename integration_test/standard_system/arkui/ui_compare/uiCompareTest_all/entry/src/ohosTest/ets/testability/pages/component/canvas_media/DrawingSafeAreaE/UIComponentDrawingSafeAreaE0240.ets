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
struct UIComponentDrawingSafeAreaE0240 {
  @State name: string = 'UIComponentDrawingSafeAreaE0240';
  @State message: string = this.name;
  @State originalPadding: Padding = {
    left: 10,
    right: 10,
    top: 20,
    bottom: 20
  };
  @State changedPadding: Padding = {
    left: 50,
    right: 50,
    top: 60,
    bottom: 60
  };
  @State paddingValue: Padding = this.originalPadding;
  @State changeInfo: string = '';
  private changedFlag: boolean = false;

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

      Button('Switch SafeAreaPadding')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          if (this.changedFlag) {
            this.changedFlag = !this.changedFlag;
            this.paddingValue = this.originalPadding;
            this.changeInfo = `SafeAreaPadding swithed to: ${JSON.stringify(this.paddingValue)}`;
          } else {
            this.changedFlag = !this.changedFlag;
            this.paddingValue = this.changedPadding;
            this.changeInfo = `SafeAreaPadding swithed to: ${JSON.stringify(this.paddingValue)}`;
          }
        })

      Text(this.message)
        .fontSize(15)
        .fontColor(Color.Pink)
        .fontWeight(FontWeight.Regular)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Text(this.changeInfo)
        .fontSize(20)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Column() {
        Text('Column')
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

        Row() {
          Text('Row')
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
        }
        .backgroundColor(Color.Orange)
        .safeAreaPadding(this.originalPadding)

      }
      .margin({
        left: 10,
        right: 10,
        top: 20,
        bottom: 20
      })
      .backgroundColor(Color.Yellow)
      .safeAreaPadding(this.paddingValue)

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
