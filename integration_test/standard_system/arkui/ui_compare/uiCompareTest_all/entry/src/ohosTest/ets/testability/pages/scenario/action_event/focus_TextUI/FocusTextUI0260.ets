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
struct FocusTextUI0260 {
  @State currentContent: string = '初始内容'; // 初始文本

  build() {
    Column() {
      Text(this.currentContent)
        .fontSize(24)
        .id('textComponent0260')
        .onClick(() => {
          this.currentContent = 'ABC123xyz789'; // 字母数字混合内容
        })
    }
    .width('100%')
    .padding(30)
  }
}