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
struct UICustomDrawingSafeAreaScene0560 {
  @State name: string = 'UICustomDrawingSafeAreaScene0560';
  @State message: string = this.name;
  @State barMode: BarMode = BarMode.Fixed;
  @State data: string = '<p>RichText content</p>';
  @State currentIndex: number = 0;
  private modeValue: KeyboardAvoidMode = KeyboardAvoidMode.RESIZE;
  @State firstState: ItemState = ItemState.Normal;
  @State secondState: ItemState = ItemState.Normal;
  @State thirdState: ItemState = ItemState.Normal;

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

      Stepper({
        index: this.currentIndex
      }) {

        StepperItem() {
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
            Text('Page One')
              .fontColor('#182431')
              .fontSize(36)
              .fontWeight(500)
              .opacity(0.4)
              .margin({
                top: 82,
                bottom: 40
              })
            Button('change status:' + this.firstState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip;
              })
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
          .height('16.39%')
          .height('32.79%')
          .margin({
            top: 48,
            left: 12
          })
          .borderRadius(24)
          .backgroundColor('#FFFFFF')
          .justifyContent(FlexAlign.Start)
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
        .nextLabel('Next')
        .status(this.firstState)

        StepperItem() {
          Column() {
            Text('Page Two')
              .fontColor('#182431')
              .fontSize(36)
              .fontWeight(500)
              .opacity(0.4)
              .margin({
                top: 82,
                bottom: 40
              })
            Button('change status:' + this.secondState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled;
              })
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
          .height('16.39%')
          .height('32.79%')
          .margin({
            top: 48,
            left: 12
          })
          .borderRadius(24)
          .backgroundColor('#FFFFFF')
          .justifyContent(FlexAlign.Center)
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
        .nextLabel('Next')
        .prevLabel('Previous')
        .status(this.secondState)

        StepperItem() {
          Column() {
            Text('Page Three')
              .fontColor('#182431')
              .fontSize(36)
              .fontWeight(500)
              .opacity(0.4)
              .margin({
                top: 82,
                bottom: 40
              })
            Button('change status:' + this.thirdState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.thirdState = this.thirdState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting;
              })
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
          .height('16.39%')
          .height('32.79%')
          .margin({
            top: 48,
            left: 12
          })
          .borderRadius(24)
          .backgroundColor('#FFFFFF')
          .justifyContent(FlexAlign.End)
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
        .status(this.thirdState)

        StepperItem() {
          Column() {
            Text('Page Four')
              .fontColor('#182431')
              .fontSize(36)
              .fontWeight(500)
              .opacity(0.4)
              .margin({
                top: 82,
                bottom: 40
              })
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
          .height('16.39%')
          .height('32.79%')
          .margin({
            top: 48,
            left: 12
          })
          .borderRadius(24)
          .backgroundColor('#FFFFFF')
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
      }
      .backgroundColor('#F1F3F5')
      .onFinish(() => {
        console.info('onFinish');
      })
      .onSkip(() => {
        console.info('onSkip');
      })
      .onChange((prevIndex?: number, index?: number) => {
        if(index){
          this.currentIndex = index;
        }
      })
      .width('60%')
      .height('60%')
      .backgroundColor(Color.Yellow)
      .id(this.name + '_03')


    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}