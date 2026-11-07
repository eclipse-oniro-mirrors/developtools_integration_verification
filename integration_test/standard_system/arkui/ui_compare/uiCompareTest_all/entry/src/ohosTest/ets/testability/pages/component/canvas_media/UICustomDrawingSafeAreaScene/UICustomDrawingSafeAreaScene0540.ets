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
struct UICustomDrawingSafeAreaScene0540 {
  @State name: string = 'UICustomDrawingSafeAreaScene0540';
  @State message: string = this.name;
  @State barMode: BarMode = BarMode.Fixed;
  @State data: string = '<p>RichText content</p>';
  private modeValue: KeyboardAvoidMode = KeyboardAvoidMode.RESIZE;

  aboutToAppear(): void {
    let uiContext = this.getUIContext();
    uiContext.setKeyboardAvoidMode(this.modeValue);
  }

  @Builder tabBuilder1() {
    Column() {
      Text('Tab1')
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .id(this.name + '_03')
    .width('100%')
  }

  @Builder tabBuilder2() {
    Column() {
      Text('Tab2')
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .id(this.name + '_04')
    .width('100%')
  }

  @Builder tabBuilder3() {
    Column() {
      Text('Tab3')
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .id(this.name + '_05')
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

      Tabs() {
        TabContent() {
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
          .justifyContent(FlexAlign.Start)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Pink)
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
        .tabBar(this.tabBuilder1())

        TabContent() {
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
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
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
        .tabBar(this.tabBuilder2())

        TabContent() {
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
          .justifyContent(FlexAlign.End)
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Orange)
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
        .tabBar(this.tabBuilder3())

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
      .height('60%')
      .backgroundColor(0xf1f3f5)
      .barMode(this.barMode)

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
