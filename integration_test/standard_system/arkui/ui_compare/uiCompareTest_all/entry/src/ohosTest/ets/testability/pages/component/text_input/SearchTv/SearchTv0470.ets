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
 * @tc.name: SUB_ACE_UI_COMPONENT_SEARCH_TV_0470
 * @tc.desc: 【Search 普通搜索框占位符超长】不推入overlay，校验标准模式下，手机样式无差异
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SearchTv0470 {
  @Local searchValue: string = '';
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SearchTv0470', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 超长占位符样式检查');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_SEARCH_TV_0470')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('超长占位符样式检查')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 15 });

      Search({ value: this.searchValue, placeholder: '这是一个非常非常长的占位符文本，用于测试当占位符超长时搜索框的显示效果是否正常，是否会出现截断或者换行等异常情况' })
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
        Text('测试说明:')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 设置超长占位符')
          .fontSize(11);
        Text('2. 查看占位符显示样式')
          .fontSize(11);
        Text('3. 验证是否正常截断或省略')
          .fontSize(11);
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#FFF3E0')
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
    .backgroundColor('#FFFFFF');
  }
}

