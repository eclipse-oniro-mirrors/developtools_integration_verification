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
struct FocusTextUI1640 {
  @State currentOffsetX: number = 0; // 声明状态变量

  build() {
    Column() {
      Text('测试文本偏移')
        .fontSize(30)
        .textShadow({
          offsetY: 0,
          offsetX: this.currentOffsetX, // 绑定状态变量
          color: '#000000',
          radius: 0
        })
        .id('textShadow1640')
        .onClick(() => { // 点击事件处理
          this.currentOffsetX = 5; // 点击后将offsetX设为5
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}