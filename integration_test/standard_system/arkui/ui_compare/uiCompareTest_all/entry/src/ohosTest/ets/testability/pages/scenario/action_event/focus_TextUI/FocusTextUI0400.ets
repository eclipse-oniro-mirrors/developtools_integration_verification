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
struct FocusTextUI0400 {
  @State fontSizes: Resource = $r('app.integer.integer_value_20'); // 字体大小资源引用

  build() {
    Column() {
      Text('这是一段测试文本，用于验证fontSize通过动态资源引用的效果。')
        .fontSize(this.fontSizes)
        .id('changeResBtn0400')
        .onClick(() => {
          this.fontSizes = $r('app.integer.integer_value_10');
        })
    }
    .width('100%')
    .padding(20)
  }
}