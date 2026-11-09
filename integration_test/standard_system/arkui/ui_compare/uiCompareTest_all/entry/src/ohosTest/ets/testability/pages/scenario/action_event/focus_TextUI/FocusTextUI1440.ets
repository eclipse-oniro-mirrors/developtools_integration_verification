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
struct FocusTextUI1440 {
  @State minSize: ResourceStr = $r('app.float.float_value_5');  // 最小字号(10fp)
  @State maxSize: ResourceStr = $r('app.float.float_value_10');  // 最大字号(20fp)
  @State maxLines: number = 2;                                    // 最大行数
  @State lineHeight: number = 10;                                // 行高，初始有效值
  @State currentSize: string = '8fp';                                  // 当前测试字号
  @State testStep: number = 1;                                  // 测试步骤

  build() {
    Column() {
      Text('这是一段静态对比文本，验证文本字号是否仍被限制在minFontSize和maxFontSize之间。')
        .fontSize('15fp')
        .padding(20)

      Text('这是一段动态测试文本，验证文本字号是否仍被限制在minFontSize和maxFontSize之间。')
        .minFontSize(this.minSize)
        .maxFontSize(this.maxSize)
        .fontSize(this.currentSize)
        .maxLines(this.maxLines)
        .lineHeight(this.lineHeight)
        .id('testBtn1440')
        .onClick(() => {
          this.maxSize = $r('app.float.float_value_20');
          this.minSize = $r('app.float.float_value_10')
          this.lineHeight = -100;
          this.maxLines = 5;
          this.testStep++;
          this.updateParams();
        })
        .padding(20)

      Text('这是一段静态对比文本，验证文本字号是否仍被限制在minFontSize和maxFontSize之间。')
        .fontSize('20fp')
        .padding(20)
    }
    .width('100%')
    .padding(20)
  }

  // 更新测试参数
  private updateParams(): void {
    switch (this.testStep) {
      case 2:  // 步骤3: 负行高，fontSize超过maxSize
        this.currentSize = '15fp';
        break;
      case 3:  // 步骤3: 负行高，fontSize超过maxSize
        this.currentSize = '25fp';
        this.testStep = 1;
        break;
    }
  }
}