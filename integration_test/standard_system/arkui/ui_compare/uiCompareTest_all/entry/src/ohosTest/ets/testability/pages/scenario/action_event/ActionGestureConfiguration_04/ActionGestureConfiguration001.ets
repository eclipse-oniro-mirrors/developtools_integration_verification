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
struct ActionGestureConfiguration001 {
  private caseName: string = 'SUB_ACE_ACTION_GESTURE_CONFIGURATION_1140';
  @State count: string = '';

  onPageShow() {
    console.info('NavDestination onPageShow')
  }

  build() {
    Row() {
      Column() {
        Text('count:' + this.count)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
          .margin({ top: 20 })
          .key('ActionGestureConfiguration003_001')

        Button('click')
          .id('click')
          .stateEffect(true)
          .margin({ top: 20 })
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer, others: GestureRecognizer[]) => {
            if (current.getType() == GestureControl.GestureType.TAP_GESTURE) {
              this.count = current.getFingerCount().toString();
              console.info(`${this.caseName} count is ${this.count}`);
            }
            return GestureJudgeResult.CONTINUE;
          })
          .gesture(
            TapGesture()
              .onAction((event: GestureEvent) => {
                if (event) {
                  console.info(`${this.caseName} fingerList is ${event.fingerList[0]}`);
                }
              })
          )
      }
      .width('100%')
      .height('100%')
    }
    .defaultFocus(true)
  }
}