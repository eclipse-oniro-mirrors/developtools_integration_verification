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
struct PopupboxFollowdialog0130 {
  @State visible: boolean = false

  build() {
    Column({ space: 20 }) {
      // 注释掉popover/builder参数的代码，验证必填性
      // 如果不提供builder参数，bindPopup将无法正常工作
      // Button('Target Button')
      //   .bindPopup(this.visible, {
      //     placement: Placement.Bottom
      //   })
      Text('popover/builder参数必填验证')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
