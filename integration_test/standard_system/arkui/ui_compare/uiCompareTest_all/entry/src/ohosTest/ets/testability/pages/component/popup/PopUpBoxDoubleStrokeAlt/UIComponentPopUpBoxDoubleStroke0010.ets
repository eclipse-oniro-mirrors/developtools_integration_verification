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
struct UIComponentPopUpBoxDoubleStroke0010 {
  @State name: string = 'UIComponentPopUpBoxDoubleStroke0010';
  @State message: string = this.name;

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('不设置描边属性')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          ActionSheet.show({
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'ActionSheet message',
            autoCancel: true,
            confirm: {
              defaultFocus: true,
              value: 'Confirm button',
              action: () => {
                console.log('Get Alert Dialog handled');
                this.message += '\n Get Alert Dialog handled';
              }
            },
            cancel: () => {
              console.log('actionSheet canceled');
              this.message += '\n actionSheet canceled';
            },
            alignment: DialogAlignment.Bottom,
            offset: {
              dx: 0,
              dy: -10
            },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('apples');
                  this.message += '\n apples';
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.log('bananas');
                  this.message += '\n bananas';
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.log('pears');
                  this.message += '\n pears';
                }
              }
            ]
          })
        })

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

}