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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011
 * @tc.desc: 连续播放多张帧间隔较小的动图，在一个列表中进行快速滑动
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageGif0011 {
  @Local testLog: string = '';

  private generateGifList(): number[] {
    let list: number[] = [];
    for (let i = 1; i <= 20; i++) {
      list.push(i);
    }
    return list;
  }

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageGif0011', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - GIF列表快速滑动测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('多张动图列表快速滑动测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      List({ space: 10 }) {
        ForEach(this.generateGifList(), (item: number) => {
          ListItem() {
            Row() {
              Image($r('app.media.icon'))
                .width(60)
                .height(60)
                .id('gif_item_' + item)
                .onComplete(() => {
                  this.addLog('GIF ' + item + ' 加载完成');
                })
              Text('动图 ' + item)
                .fontSize(14)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
          }
        })
      }
      .width('100%')
      .height('24.59%')
      .id('gif_list')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 快速滑动多次检测是否存在问题\n2. 动图播放连贯\n3. 不可见后也可停止播放')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('6.56%')
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

