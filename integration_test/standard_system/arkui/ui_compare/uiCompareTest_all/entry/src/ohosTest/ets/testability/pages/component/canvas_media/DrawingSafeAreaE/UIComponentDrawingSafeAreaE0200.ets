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
struct UIComponentDrawingSafeAreaE0200 {
  @State name: string = 'UIComponentDrawingSafeAreaE0200';
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
  @State paddingValue1: Padding = this.originalPadding;
  @State changeInfo1: string = '';
  private changedFlag1: boolean = false;
  @State paddingValue2: Padding = this.originalPadding;
  @State changeInfo2: string = '';
  private changedFlag2: boolean = false;


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

      Row() {
        Column() {
          Text('Column1')
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
              if (this.changedFlag1) {
                this.changedFlag1 = !this.changedFlag1;
                this.paddingValue1 = this.originalPadding;
                this.changeInfo1 = `SafeAreaPadding swithed to: ${JSON.stringify(this.paddingValue1)}`;
              } else {
                this.changedFlag1 = !this.changedFlag1;
                this.paddingValue1 = this.changedPadding;
                this.changeInfo1 = `SafeAreaPadding swithed to: ${JSON.stringify(this.paddingValue1)}`;
              }
            })

          Row() {
            TextInput({
              placeholder: 'TextInput in row'
            })
              .width('50%')
              .height(35)
              .type(InputType.Number)
              .enterKeyType(EnterKeyType.Done)
              .caretColor(Color.Red)
              .placeholderColor(Color.Blue)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .backgroundColor(Color.Orange)
          .safeAreaPadding(this.originalPadding)
          .margin({
            left: 10,
            right: 10,
            top: 20,
            bottom: 20
          })
          .padding({
            left: 10,
            right: 10,
            top: 20,
            bottom: 20
          })

          TextInput({
            placeholder: 'TextInput in column'
          })
            .width('50%')
            .height(35)
            .type(InputType.Number)
            .enterKeyType(EnterKeyType.Done)
            .caretColor(Color.Red)
            .placeholderColor(Color.Blue)
            .placeholderFont({
              size: 20,
              style: FontStyle.Italic,
              weight: FontWeight.Bold
            })

          Text(this.changeInfo1)
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

        }
        .margin({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })
        .padding({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })
        .safeAreaPadding(this.paddingValue1)
        .backgroundColor(Color.Yellow)
        .width('50%')
        .height('100%')

        Column() {
          Text('Column2')
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
            .id(this.name + '_02')
            .borderRadius(20)
            .backgroundColor(0x317aff)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin(10)
            .onClick(() => {
              if (this.changedFlag2) {
                this.changedFlag2 = !this.changedFlag2;
                this.paddingValue2 = this.originalPadding;
                this.changeInfo2 = `SafeAreaPadding swithed to: ${JSON.stringify(this.paddingValue2)}`;
              } else {
                this.changedFlag2 = !this.changedFlag2;
                this.paddingValue2 = this.changedPadding;
                this.changeInfo2 = `SafeAreaPadding swithed to: ${JSON.stringify(this.paddingValue2)}`;
              }
            })

          TextInput({
            placeholder: 'TextInput in column'
          })
            .width('50%')
            .height(35)
            .type(InputType.Number)
            .enterKeyType(EnterKeyType.Done)
            .caretColor(Color.Red)
            .placeholderColor(Color.Blue)
            .placeholderFont({
              size: 20,
              style: FontStyle.Italic,
              weight: FontWeight.Bold
            })

          Row() {
            TextInput({
              placeholder: 'TextInput in row'
            })
              .width('50%')
              .height(35)
              .type(InputType.Number)
              .enterKeyType(EnterKeyType.Done)
              .caretColor(Color.Green)
              .placeholderColor(Color.Blue)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
          }
          .backgroundColor(Color.Orange)
          .safeAreaPadding(this.originalPadding)
          .margin({
            left: 10,
            right: 10,
            top: 20,
            bottom: 20
          })
          .padding({
            left: 10,
            right: 10,
            top: 20,
            bottom: 20
          })

          Text(this.changeInfo2)
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

        }
        .margin({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })
        .padding({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })
        .safeAreaPadding(this.paddingValue2)
        .backgroundColor(Color.Pink)
        .width('50%')
        .height('100%')
      }
      .width('100%')

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
