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
struct TextFadingEdgeTV0040 {

  controller: SearchController = new SearchController();
  @State Alignment:TextAlign = TextAlign.Start
  @State trans:boolean = false
  @State font:Font = {size:20,weight:600}

  build() {
    Column({ space: 3 }) {
      Search({ value: 'Search textAlign sample,Search textAlign sample,Search textAlign sample,Search textAlign sample', controller: this.controller })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .stopBackPress(true)
        .textAlign(this.Alignment)
        .caretStyle({ width: 3, color: Color.Green })
        .selectedBackgroundColor(Color.Gray)
        .defaultFocus(true)
        .enableKeyboardOnFocus(true)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .textFont(this.font)
        Button('font change', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0040_001')
          .onClick(() => {
            this.font = {size:24,weight:800}
          })
        Button('x', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0040_002')
          .onClick(() => {
            // 关闭自定义键盘
            this.controller.stopEditing();
          })
    }
    .width('100%')
    .height('100%')
  }
}
