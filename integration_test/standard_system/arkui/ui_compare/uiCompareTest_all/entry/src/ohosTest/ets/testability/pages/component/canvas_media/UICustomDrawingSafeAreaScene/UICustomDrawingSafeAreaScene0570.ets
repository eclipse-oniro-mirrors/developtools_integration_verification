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

@Entry
@Component
struct UICustomDrawingSafeAreaScene0570 {
  @State name: string = 'UICustomDrawingSafeAreaScene0570';
  @State message: string = this.name;
  @State barMode: BarMode = BarMode.Fixed;
  @State data: string = '<p>RichText content</p>';
  private modeValue: KeyboardAvoidMode = KeyboardAvoidMode.RESIZE;

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
                  SafeAreaType.SYSTEM,
                  SafeAreaType.CUTOUT,
                  SafeAreaType.KEYBOARD
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
              SafeAreaType.SYSTEM,
              SafeAreaType.CUTOUT,
              SafeAreaType.KEYBOARD
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
                  SafeAreaType.SYSTEM,
                  SafeAreaType.CUTOUT,
                  SafeAreaType.KEYBOARD
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
              SafeAreaType.SYSTEM,
              SafeAreaType.CUTOUT,
              SafeAreaType.KEYBOARD
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
                  SafeAreaType.SYSTEM,
                  SafeAreaType.CUTOUT,
                  SafeAreaType.KEYBOARD
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
              SafeAreaType.SYSTEM,
              SafeAreaType.CUTOUT,
              SafeAreaType.KEYBOARD
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
            SafeAreaType.SYSTEM,
            SafeAreaType.CUTOUT,
            SafeAreaType.KEYBOARD
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
          SafeAreaType.SYSTEM,
          SafeAreaType.CUTOUT,
          SafeAreaType.KEYBOARD
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
      .height('80%')
      .width('80%')

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
