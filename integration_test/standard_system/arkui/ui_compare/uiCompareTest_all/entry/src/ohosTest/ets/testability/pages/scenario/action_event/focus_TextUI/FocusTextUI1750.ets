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
struct FocusTextUI1750 {
  @State policy: TextHeightAdaptivePolicy = TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST; // 初始策略
  @State maxLine: number = 2; // 初始行高

  build() {
    Column() {
      Text('这是一段测试文本，用于验证当设置TextHeightAdaptivePolicy为MIN_FONT_SIZE_FIRST的效果。')
        .fontSize(20)
        .maxLines(this.maxLine)
        .heightAdaptivePolicy(this.policy)
        .id('configBtn1750')
        .onClick(() => {
          this.policy = TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST;
          this.maxLine = 5;
        })
    }
    .width('100%')
    .padding(20)
  }
}