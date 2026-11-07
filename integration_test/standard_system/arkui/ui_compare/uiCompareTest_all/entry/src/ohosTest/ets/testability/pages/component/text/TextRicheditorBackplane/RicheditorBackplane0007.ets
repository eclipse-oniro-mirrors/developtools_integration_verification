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
 * @tc.name: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BACKPLANE_0007
 * @tc.desc: builderspan_A设置红色背板需要投影；builderspan_B设置红色背板需要投影
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RicheditorBackplane0007 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RicheditorBackplane0007', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 2个builderspan红色背板投影测试');
  }

  @Builder
  builderSpanA() {
    Text('BuilderSpan_A')
      .fontSize(14)
      .fontColor('#FFFFFF')
      .backgroundColor('#F44336')
      .padding(8)
      .borderRadius(4)
      .shadow({ radius: 5, color: '#80000000', offsetX: 2, offsetY: 2 });
  }

  @Builder
  builderSpanB() {
    Text('BuilderSpan_B')
      .fontSize(14)
      .fontColor('#FFFFFF')
      .backgroundColor('#F44336')
      .padding(8)
      .borderRadius(4)
      .shadow({ radius: 5, color: '#80000000', offsetX: 2, offsetY: 2 });
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_BACKPLANE_0007')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('2个builderspan红色背板+投影')
        .fontSize(12)
        .margin({ bottom: 10 });

      // 模拟RichEditor区域
      Column() {
        Text('RichEditor区域')
          .fontSize(10)
          .fontColor('#666666')
          .margin({ bottom: 5 });

        Row({ space: 10 }) {
          this.builderSpanA();
          this.builderSpanB();
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

        Text('1. 组件内添加2个builderspan')
          .fontSize(10);
        Text('2. builderspan_A设置红色背板，需要投影')
          .fontSize(10);
        Text('3. builderspan_B设置红色背板，需要投影')
          .fontSize(10);
        Text('4. 一起拖拽2个builderspan')
          .fontSize(10);
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#FFEBEE')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Column() {
        Text('预期结果:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('拖拽背板白色，有投影，拖拽过渡动画正常')
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

