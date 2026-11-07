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
struct UICustomDrawingSafeAreaScene0520 {
  @State name: string = 'UICustomDrawingSafeAreaScene0520';
  @State message: string = this.name;
  @State isRefreshing: boolean = false;
  @State data: string = '<p>RichText content</p>';
  private modeValue: KeyboardAvoidMode = KeyboardAvoidMode.OFFSET;

  aboutToAppear(): void {
    let uiContext = this.getUIContext();
    uiContext.setKeyboardAvoidMode(this.modeValue);
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

      Row() {
        Column() {
          Refresh({ refreshing: $$this.isRefreshing }) {
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
              .height('80%')
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
          .onStateChange((refreshStatus: RefreshStatus) => {
            console.info('Refresh onStatueChange state is ' + refreshStatus);
          })
          .onOffsetChange((value: number) => {
            console.info('Refresh onOffsetChange offset:' + value);
          })
          .onRefreshing(() => {
            setTimeout(() => {
              this.isRefreshing = false;
            }, 1000)
            console.log('onRefreshing test');
          })
          .backgroundColor(0x89CFFF)
          .refreshOffset(64)
          .pullToRefresh(true)
          .width('100%')
          .height('20%')
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
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
        .width('30%')
        .height('100%')


        Column() {
          Refresh({ refreshing: $$this.isRefreshing }) {
            RichText(this.data)
              .onStart(() => {
                console.info('RichText onStart');
              })
              .onComplete(() => {
                console.info('RichText onComplete');
              })
              .width('80%')
              .height('80%')
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
          .onStateChange((refreshStatus: RefreshStatus) => {
            console.info('Refresh onStatueChange state is ' + refreshStatus);
          })
          .onOffsetChange((value: number) => {
            console.info('Refresh onOffsetChange offset:' + value);
          })
          .onRefreshing(() => {
            setTimeout(() => {
              this.isRefreshing = false;
            }, 1000)
            console.log('onRefreshing test');
          })
          .backgroundColor(0x89CF00)
          .refreshOffset(64)
          .pullToRefresh(true)
          .width('100%')
          .height('80%')
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
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
        .width('30%')
        .height('100%')


        Column() {
          Refresh({ refreshing: $$this.isRefreshing }) {
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
              .height('80%')
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
          .onStateChange((refreshStatus: RefreshStatus) => {
            console.info('Refresh onStatueChange state is ' + refreshStatus);
          })
          .onOffsetChange((value: number) => {
            console.info('Refresh onOffsetChange offset:' + value);
          })
          .onRefreshing(() => {
            setTimeout(() => {
              this.isRefreshing = false;
            }, 1000)
            console.log('onRefreshing test');
          })
          .backgroundColor(0x89C000)
          .refreshOffset(64)
          .pullToRefresh(true)
          .width('100%')
          .height('20%')
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
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
        .width('30%')
        .height('100%')

      }
      .justifyContent(FlexAlign.Center)
      .width('80%')
      .backgroundColor('#a3cf62')

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
    .backgroundColor(Color.Yellow)
    .width('100%')
    .height('100%')
  }
}
