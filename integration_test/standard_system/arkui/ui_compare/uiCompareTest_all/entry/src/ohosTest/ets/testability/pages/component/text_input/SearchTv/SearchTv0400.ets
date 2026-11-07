/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @tc.name: SUB_ACE_UI_COMPONENT_SEARCH_TV_0400
 * @tc.desc: 【Search 普通搜索框 normal】不推入overlay，校验深色模式下，手机样式无差异
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SearchTv0400 {
  @Local searchValue: string = '';
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SearchTv0400', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 深色模式Search样式检查');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_SEARCH_TV_0400')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('深色模式下Search样式检查')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 15 });

      Search({ value: this.searchValue, placeholder: '搜索内容' })
        .id('searchInput')
        .width('90%')
        .height(48)
        .searchButton('搜索')
        .onChange((value: string) => {
          this.searchValue = value;
          this.addLog(`输入内容: ${value}`);
        })
        .margin({ bottom: 15 });

      Column() {
        Text('检查项目:')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 水印颜色')
          .fontSize(11);
        Text('2. 高度')
          .fontSize(11);
        Text('3. 描边粗细')
          .fontSize(11);
        Text('4. 描边颜色')
          .fontSize(11);
        Text('5. 水印大小')
          .fontSize(11);
        Text('6. 圆角')
          .fontSize(11);
        Text('7. 搜索框颜色')
          .fontSize(11);
        Text('8. 搜索图标大小')
          .fontSize(11);
        Text('9. 搜索图标颜色')
          .fontSize(11);
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#263238')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Text('预期: 手机UX样式与之前无差异')
        .fontSize(11)
        .fontColor('#4CAF50')
        .margin({ top: 15 });

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
      .width('90%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#121212');
  }
}

