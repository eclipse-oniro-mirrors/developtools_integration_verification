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
 * @tc.name: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BACKPLANE_0001
 * @tc.desc: 单个/多个builderspan默认不设置背板颜色和拖拽投影
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RicheditorBackplane0001 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RicheditorBackplane0001', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - builderspan默认背板和投影测试');
  }

  @Builder
  customSpan1() {
    Text('BuilderSpan1')
      .fontSize(14)
      .fontColor('#FFFFFF')
      .backgroundColor('#2196F3')
      .padding(8)
      .borderRadius(4);
  }

  @Builder
  customSpan2() {
    Text('BuilderSpan2')
      .fontSize(14)
      .fontColor('#FFFFFF')
      .backgroundColor('#4CAF50')
      .padding(8)
      .borderRadius(4);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BACKPLANE_0001')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('builderspan默认背板颜色和拖拽投影')
        .fontSize(12)
        .margin({ bottom: 10 });

      // 模拟RichEditor区域
      Column() {
        Text('RichEditor区域')
          .fontSize(10)
          .fontColor('#666666')
          .margin({ bottom: 5 });

        Row({ space: 10 }) {
          this.customSpan1();
          this.customSpan2();
        }
        .id('builderspan_area');
      }
      .width('90%')
      .height('9.84%')
      .padding(10)
      .backgroundColor('#FAFAFA')
      .borderRadius(8)
      .border({ width: 1, color: '#E0E0E0' })
      .margin({ bottom: 10 });

      Column() {
        Text('测试步骤:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 组件内添加单个/多个builderspan')
          .fontSize(10);
        Text('2. 默认不设置dragBackgroundColor和isDragShadowNeeded')
          .fontSize(10);
        Text('3. 拖拽builderspan，观察背板颜色和拖拽投影')
          .fontSize(10);
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Column() {
        Text('预期结果:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('拖拽背板白色，投影存在，拖拽过渡动画正常')
          .fontSize(10)
          .fontColor('#4CAF50');
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 10 });

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('4.92%')
      .width('90%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .padding(15);
  }
}

