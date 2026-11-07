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
struct FocusTextUI1430 {
  @State minSize: ResourceStr = $r('app.float.float_value_10'); // 最小字号(10fp)
  @State maxSize: ResourceStr = $r('app.float.float_value_20'); // 最大字号(20fp)
  @State maxLines: number = 5;                                   // 最大行数
  @State lineHeight: ResourceStr = $r('app.float.float_value_30'); // 行高(30fp)
  @State currentSize: string = '10fp';                              // 当前测试字号
  @State testStep: number = 0;                                 // 测试步骤

  build() {
    Column() {

      Text('这是一段对比文本，用于验证当设置minFontSize=10fp, maxFontSize=20fp时，' +
        '文本字号是否被限制在10-20fp之间。')
        .fontSize(15)
        .padding(20)

      Text('这是一段测试文本，用于验证当设置minFontSize=10fp, maxFontSize=20fp时，' +
        '文本字号是否被限制在10-20fp之间。')
        .fontSize(this.currentSize)
        .minFontSize(this.minSize)
        .maxFontSize(this.maxSize)
        .maxLines(this.maxLines)
        .lineHeight(this.lineHeight)
        .id('testBtn1430')
        .onClick(() => {
          this.nextTestStep();
        })
        .padding(20)

      Text('这是一段对比文本，用于验证当设置minFontSize=10fp, maxFontSize=20fp时，' +
        '文本字号是否被限制在10-20fp之间。')
        .fontSize(20)
        .padding(20)
    }
    .width('100%')
  }


  // 更新测试步骤
  private nextTestStep(): void {
    if (this.testStep < 3) {
      this.testStep++;
      this.updateFontSize();
    }
  }

  // 更新字体大小
  private updateFontSize(): void {
    switch (this.testStep) {
      case 1: this.currentSize = '10fp'; break; // 等于minSize
      case 2: this.currentSize = '15fp'; break; // 在区间内
      case 3: this.currentSize = '22fp'; break; // 超过maxSize
    }
  }
}