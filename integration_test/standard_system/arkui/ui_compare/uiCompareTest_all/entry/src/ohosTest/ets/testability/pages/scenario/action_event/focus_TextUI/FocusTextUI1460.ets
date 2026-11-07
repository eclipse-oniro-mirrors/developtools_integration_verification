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
struct FocusTextUI1460 {
  @State textCaseValue: TextCase = TextCase.Normal; // 初始文本大小写
  @State originalText: string = 'hello World 123!'; // 原始文本

  build() {
    Column() {
      Text(this.originalText)
        .fontSize(20)
        .textCase(this.textCaseValue)
        .id('CaseBtn1460')
        .onClick(() => {
          this.textCaseValue = TextCase.UpperCase; // 设置为大写
        })
    }
    .width('100%')
    .padding(20)
  }
}