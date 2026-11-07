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
struct UIComponentDrawingSafeAreaE0350 {
  @State name: string = 'UIComponentDrawingSafeAreaE0350';
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
      Text(this.message)
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

      Stack({alignContent: Alignment.Top}) {

        TextInput({
          placeholder: 'TextInput 1'
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

        TextInput({
          placeholder: 'TextInput 2'
        })
          .width('70%')
          .height(85)
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
            .caretColor(Color.Red)
            .placeholderColor(Color.Blue)
            .placeholderFont({
              size: 20,
              style: FontStyle.Italic,
              weight: FontWeight.Bold
            })
        }
        .backgroundColor(Color.Orange)
        .safeAreaPadding(this.paddingValue)
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
      }
      .backgroundColor(Color.Yellow)
      .safeAreaPadding(this.originalPadding)

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
