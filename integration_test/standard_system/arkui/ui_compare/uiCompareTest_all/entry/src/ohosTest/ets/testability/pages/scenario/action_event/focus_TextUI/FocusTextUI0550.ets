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
struct FocusTextUI0550 {
  @State currentSize:FontWeight = FontWeight.Bold; //

  build() {
    Column() {
      Text('字体粗细测试')
        .fontWeight(this.currentSize)
        .id('Size0550')
        .onClick(() => {
          this.currentSize = FontWeight.Normal; //
        })
    }
    .padding(20)
  }
}