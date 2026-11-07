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
struct FocusTextUI0780 {
  @State lineHeightValue: string = '20fp'; // 初始有效值

  build() {
    Column() {
      Text('动态测试行高50fp文本')
        .fontSize(24)
        .lineHeight(this.lineHeightValue) // 解析行高值
        .id('paramBtn0780')
        .onClick(() => {
          this.lineHeightValue = '50fp'; // 设置
        })
    }
    .width('100%')
    .padding(20)
  }
}