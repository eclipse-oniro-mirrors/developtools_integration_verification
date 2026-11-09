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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentMediaImageAnimatorMonitorInvisibleArea0011 {
  @State name: string = 'UIComponentMediaImageAnimatorMonitorInvisibleArea0011';
  @State message: string = 'UIComponentMediaImageAnimatorMonitorInvisibleArea0011';
  @State state: AnimationStatus = AnimationStatus.Initial;
  @State iterations: number = -1;
  @State monitorInvisibleAreaFlag: boolean = false;
  @State visibilityFlag: Visibility = Visibility.Visible;

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .margin(10)

      ImageAnimator()
        .images([
          {
            src: '/images/1.png'
          },
          {
            src: '/images/2.png'
          },
          {
            src: '/images/3.png'
          },
          {
            src: '/images/4.png'
          }
        ])
        .duration(2000)
        .state(this.state)
        .fillMode(FillMode.None)
        .iterations(this.iterations)
        .monitorInvisibleArea(this.monitorInvisibleAreaFlag)
        .visibility(this.visibilityFlag)
        .width(340)
        .height(240)
        .margin({ top: 100 })
        .onStart(() => {
          this.message += '\n onStart triggered.';
        })
        .onPause(() => {
          this.message += '\n onPause triggered.';
        })
        .onCancel(() => {
          this.message += '\n onCancel triggered.';
        })

      Row() {
        Button('start')
          .id(this.name + '_01')
          .width(100)
          .padding(5)
          .onClick(() => {
          this.state = AnimationStatus.Running;
        })
          .margin(5)
        Button('pause')
          .width(100)
          .padding(5)
          .onClick(() => {
          this.state = AnimationStatus.Paused;
        })
          .margin(5)
        Button('stop')
          .width(100)
          .padding(5)
          .onClick(() => {
          this.state = AnimationStatus.Stopped;
        })
          .margin(5)
      }

      Button('switch visibility')
        .id(this.name + '_02')
        .width(100)
        .padding(5)
        .margin(5)
        .onClick(() => {
          if (this.visibilityFlag === Visibility.Visible) {
            this.visibilityFlag = Visibility.Hidden;
          } else {
            this.visibilityFlag = Visibility.Visible;
          }
        })

    }.width('100%').height('100%')
  }
}
