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
import { KeyboardAvoidMode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UICustomDrawingSafeAreaScene0970PageB {
  @State name: string = 'UICustomDrawingSafeAreaScene0970PageB';
  @State message: string = '';
  @State barMode: BarMode = BarMode.Fixed;
  @State data: string = '<p>RichText content</p>';
  private modeValue: KeyboardAvoidMode = KeyboardAvoidMode.OFFSET;

  aboutToAppear(): void {
    let uiContext = this.getUIContext();
    uiContext.setKeyboardAvoidMode(this.modeValue);
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text('Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)

      Text('subtitle')
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({
          top: 2,
          bottom: 20
        })
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  NavigationMenus() {
    Row() {
      Text('menu1')
        .fontSize(20)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('menu2')
        .fontSize(20)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({ left: 24 })

      Text('menu3')
        .fontSize(20)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({ left: 24 })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

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

      Button('Jump to page A')
        .id(this.name + '_03')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();
          router.pushUrl({
            url: 'testability/pages/component/canvas_media/UICustomDrawingSafeAreaScene/UICustomDrawingSafeAreaScene0970_pageA',
          })
            .then(() => {
              console.info('succeeded');
              this.message = 'Jump to page A succeed.';
            })
            .catch((error: BusinessError) => {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
              this.message = `Jump to page A failed, code is ${error.code}, message is ${error.message}.`;
            })
        })
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)

      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Navigation() {
        Row() {
          Column() {
            TextInput({
              placeholder: 'TextInput placeholder'
            })
              .type(InputType.Number)
              .enterKeyType(EnterKeyType.Done)
              .caretColor(Color.Red)
              .placeholderColor(Color.Blue)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
              .width('80%')
              .height('20%')
              .id(this.name + '_01')
              .expandSafeArea(
                [
                  SafeAreaType.CUTOUT
                ],
                [
                  SafeAreaEdge.TOP,
                  SafeAreaEdge.BOTTOM,
                  SafeAreaEdge.START,
                  SafeAreaEdge.END
                ]
              )
          }
          .expandSafeArea(
            [
              SafeAreaType.CUTOUT
            ],
            [
              SafeAreaEdge.TOP,
              SafeAreaEdge.BOTTOM,
              SafeAreaEdge.START,
              SafeAreaEdge.END
            ]
          )
          .justifyContent(FlexAlign.Start)
          .width('30%')
          .height('100%')
          .backgroundColor(0x89CFFF)

          Column() {
            RichText(this.data)
              .onStart(() => {
                console.info('RichText onStart');
              })
              .onComplete(() => {
                console.info('RichText onComplete');
              })
              .width('80%')
              .height('20%')
              .expandSafeArea(
                [
                  SafeAreaType.CUTOUT
                ],
                [
                  SafeAreaEdge.TOP,
                  SafeAreaEdge.BOTTOM,
                  SafeAreaEdge.START,
                  SafeAreaEdge.END
                ]
              )
          }
          .expandSafeArea(
            [
              SafeAreaType.CUTOUT
            ],
            [
              SafeAreaEdge.TOP,
              SafeAreaEdge.BOTTOM,
              SafeAreaEdge.START,
              SafeAreaEdge.END
            ]
          )
          .justifyContent(FlexAlign.Center)
          .width('30%')
          .height('100%')
          .backgroundColor(0x89CF00)

          Column() {
            TextArea({
              placeholder: 'TextArea placeholder'
            })
              .enterKeyType(EnterKeyType.Done)
              .caretColor(Color.Red)
              .placeholderColor(Color.Blue)
              .placeholderFont({
                size: 20,
                style: FontStyle.Italic,
                weight: FontWeight.Bold
              })
              .id(this.name + '_02')
              .width('80%')
              .height('20%')
              .expandSafeArea(
                [
                  SafeAreaType.CUTOUT
                ],
                [
                  SafeAreaEdge.TOP,
                  SafeAreaEdge.BOTTOM,
                  SafeAreaEdge.START,
                  SafeAreaEdge.END
                ]
              )
          }
          .expandSafeArea(
            [
              SafeAreaType.CUTOUT
            ],
            [
              SafeAreaEdge.TOP,
              SafeAreaEdge.BOTTOM,
              SafeAreaEdge.START,
              SafeAreaEdge.END
            ]
          )
          .justifyContent(FlexAlign.End)
          .width('30%')
          .height('100%')
          .backgroundColor(0x89C000)

        }
        .expandSafeArea(
          [
            SafeAreaType.CUTOUT
          ],
          [
            SafeAreaEdge.TOP,
            SafeAreaEdge.BOTTOM,
            SafeAreaEdge.START,
            SafeAreaEdge.END
          ]
        )
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('100%')

      }
      .expandSafeArea(
        [
          SafeAreaType.CUTOUT
        ],
        [
          SafeAreaEdge.TOP,
          SafeAreaEdge.BOTTOM,
          SafeAreaEdge.START,
          SafeAreaEdge.END
        ]
      )
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(NavigationTitleMode.Full)
      .backgroundColor('#F1F3F5')
      .hideTitleBar(false)
      .hideToolBar(false)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
      .height('60%')
      .width('80%')

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}