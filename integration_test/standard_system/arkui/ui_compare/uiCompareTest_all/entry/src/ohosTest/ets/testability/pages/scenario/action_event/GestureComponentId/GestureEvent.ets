/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct GestureEventPage {
  @State inputLog: string = '';
  @State log: string = '';

  build() {
    Column() {
      Text('GestureEvent').fontSize(16).margin(8)
      Text(this.inputLog ? '输入手势: ' + this.inputLog : '输入手势: (Tap/Pan/Pinch/Swipe操作后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Button('Tap').id('gesture_tap').gesture(TapGesture().onAction(() => { this.inputLog = 'Tap点击'; this.log = '检查结果 id:gesture_tap area:热区'; })).margin(4)
      Button('Pan').id('gesture_pan').gesture(PanGesture().onActionUpdate(() => { this.inputLog = 'Pan滑动'; this.log = '检查结果 id:gesture_pan area:热区'; })).margin(4)
      Button('Pinch').id('gesture_pinch').gesture(PinchGesture().onActionUpdate(() => { this.inputLog = 'Pinch捏合'; this.log = '检查结果 id:gesture_pinch area:热区'; })).margin(4)
      Button('Swipe').id('gesture_swipe').gesture(SwipeGesture({ direction: SwipeDirection.All }).onAction(() => { this.inputLog = 'Swipe滑动手势'; this.log = '检查结果 id:gesture_swipe area:热区'; })).margin(4)
      Text(this.log ? this.log : '检查结果: (手势操作后显示id与area)').fontSize(12).fontColor(Color.Red).margin(8)
    }
    .width('100%')
    .height('100%')
  }
}
