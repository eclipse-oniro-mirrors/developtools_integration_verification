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
struct FocusTextUI1410 {
  @State minSize: ResourceStr = $r('app.float.float_value_5'); // 最小字号资源(10fp)
  @State maxSize: string = '15fp';                              // 最大字号初始值(16fp)
  @State currentSize: string = '10fp';                           // 当前字号，初始为minSize
  @State testStep: number = 0;                              // 测试步骤标记

  build() {
    Column() {
      Text(this.getButtonText())
        .fontSize(this.currentSize)
        .minFontSize(this.minSize)
        .maxFontSize(this.maxSize)
        .id('testBtn1410')
        .onClick(() => {
          this.maxSize = '';
          this.minSize = $r('app.float.float_value_10')
          this.nextTestStep();
        })
        .padding(20)


    }
    .width('100%')
    .height('100%')
  }

  // 获取按钮文本
  private getButtonText(): string {
    switch (this.testStep) {
      case 0: return '测试文本FontSize变化.最小';
      case 1: return '测试文本FontSize变化.中间';
      case 2: return '测试文本FontSize变化.最大';
      default: return '测试完成';
    }
  }

  // 切换测试步骤
  private nextTestStep(): void {
    if (this.testStep < 3) {
      this.testStep++;
      this.updateFontSize();
    }
  }

  // 更新当前字号
  private updateFontSize(): void {
    switch (this.testStep) {
      case 1: this.currentSize = '10fp'; break;    // 步骤1: 设置为minSize
      case 2: this.currentSize = '13fp'; break;    // 步骤2: 设置为中间值
      case 3: this.currentSize = '16fp'; break;    // 步骤3: 设置为超过maxSize
      default: break;
    }
  }
}