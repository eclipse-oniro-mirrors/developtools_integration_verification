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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0160
 * @tc.desc: 生态图片加载情况
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0160 {
  @Local testLog: string = '';
  @Local loadedCount: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0160', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 生态图片加载测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0160')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('生态图片加载情况测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Grid() {
        GridItem() {
          Image($r('app.media.icon'))
            .width(60)
            .height(60)
            .id('eco_img_1')
            .onComplete(() => {
              this.loadedCount++;
              this.addLog('生态图片1加载完成');
            })
        }
        GridItem() {
          Image($r('app.media.icon'))
            .width(60)
            .height(60)
            .id('eco_img_2')
            .onComplete(() => {
              this.loadedCount++;
              this.addLog('生态图片2加载完成');
            })
        }
        GridItem() {
          Image($r('app.media.icon'))
            .width(60)
            .height(60)
            .id('eco_img_3')
            .onComplete(() => {
              this.loadedCount++;
              this.addLog('生态图片3加载完成');
            })
        }
        GridItem() {
          Image($r('app.media.icon'))
            .width(60)
            .height(60)
            .id('eco_img_4')
            .onComplete(() => {
              this.loadedCount++;
              this.addLog('生态图片4加载完成');
            })
        }
        GridItem() {
          Image($r('app.media.icon'))
            .width(60)
            .height(60)
            .id('eco_img_5')
            .onComplete(() => {
              this.loadedCount++;
              this.addLog('生态图片5加载完成');
            })
        }
        GridItem() {
          Image($r('app.media.icon'))
            .width(60)
            .height(60)
            .id('eco_img_6')
            .onComplete(() => {
              this.loadedCount++;
              this.addLog('生态图片6加载完成');
            })
        }
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height('12.3%')
      .margin({ bottom: 10 })

      Text('已加载图片数: ' + this.loadedCount + '/6')
        .fontSize(12)
        .fontColor(this.loadedCount === 6 ? '#00AA00' : '#333333')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置src图片为生态图片\n预期: 图片全部显示')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

