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
struct FocusTextUI1310 {
  @State minSize: number = 10;      // 最小字号资源(10fp)
  @State maxSize: number = 15;                               // 最大字号初始值(16fp)
  @State maxLines: number = -100;                                   // 最大行数
  @State currentSize:  number = 12;                           // 当前字号，初始为minSize
  @State testStep: number = 0;                              // 测试步骤标记

  build() {
    Column() {
      Text('这是一段对比文本，用于对比验证当设置minFontSize=20fp, maxFontSize=30fp时，文本字号是否被限制在20-30fp之间。')
        .fontSize(20)
        .padding(20)

      Text('这是一段测试文本，用于动态验证当设置minFontSize=20fp, maxFontSize=30fp时，文本字号是否被限制在20-30fp之间。')
        .minFontSize(this.minSize)
        .maxFontSize(this.maxSize)
        .maxLines(this.maxLines)
        .fontSize(this.currentSize)
        .id('testBtn1310')
        .onClick(() => {
          this.minSize = 20;
          this.maxSize = 30;
        })
        .padding(20)

      Text('这是一段对比文本，用于对比验证当设置minFontSize=20fp, maxFontSize=30fp时，文本字号是否被限制在20-30fp之间。')
        .fontSize(30)
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

}