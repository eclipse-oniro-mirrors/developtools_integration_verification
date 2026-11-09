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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0017
 * @tc.desc: 设置多任务查看是否有缓存适配横竖屏显示
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageAnimateDisplay0017 {
  @Local testLog: string = '';
  @Local orientation: string = '竖屏';
  @Local reenteredCount: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageAnimateDisplay0017', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 多任务缓存适配横竖屏测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0017')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('多任务缓存适配横竖屏测试')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('当前方向: ' + this.orientation + ' | 重进次数: ' + this.reenteredCount)
        .fontSize(11)
        .fontColor('#666666')
        .margin({ bottom: 10 })

      Grid() {
        ForEach([1, 2, 3, 4], (item: number) => {
          GridItem() {
            Column() {
              Image($r('app.media.icon'))
                .width(70)
                .height(70)
                .id('task_img_' + item)
                .onComplete(() => {
                  this.addLog('任务' + item + '加载完成');
                })
              Text('任务' + item)
                .fontSize(9)
            }
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height('14.75%')
      .margin({ bottom: 10 })

      Row() {
        Button('息屏恢复')
          .id('btn_reenter')
          .fontSize(11)
          .onClick(() => {
            this.reenteredCount++;
            this.addLog('第' + this.reenteredCount + '次息屏恢复');
          })
      }

      Row() {
        Button('横屏')
          .id('btn_landscape')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.orientation = '横屏';
            this.addLog('切换到横屏');
          })
        Button('竖屏')
          .id('btn_portrait')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.orientation = '竖屏';
            this.addLog('切换到竖屏');
          })
        Button('重置')
          .id('btn_reset')
          .fontSize(11)
          .onClick(() => {
            this.reenteredCount = 0;
            this.addLog('重置计数');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 初始页面多任务\n2. 适配横竖屏、息屏后返回第二次进入\n预期: 多页面任务互不影响，动图正常加载显示')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('4.92%')
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

