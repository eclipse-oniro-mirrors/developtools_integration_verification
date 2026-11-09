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
struct UiComponentTextPickerGesture17c8 {
  range: string[][] = [['省1', '省2', '省3'], ['市1', '市2', '市3'], ['区1', '区2', '区3']]
  build() {
    Column({ space: 12 }) {
      Text('TestCase_17c8e9a5845645029f5c7b91379c3fa9')
        .fontSize(11)
      TextPicker({ range: this.range })
        .id('textpicker_gesture_17c8')
        .height(220)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
