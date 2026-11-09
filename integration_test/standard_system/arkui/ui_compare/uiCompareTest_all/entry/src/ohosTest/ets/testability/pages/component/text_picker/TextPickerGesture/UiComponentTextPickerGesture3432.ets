/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct UiComponentTextPickerGesture3432 {
  range: string[] = ['A', 'B', 'C', 'D', 'E', 'F']
  build() {
    Column({ space: 12 }) {
      Text('TestCase_3432d74b60784c37a3bbd9e7827161e7')
        .fontSize(11)
      TextPicker({ range: this.range })
        .id('textpicker_gesture_3432')
        .height(220)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
