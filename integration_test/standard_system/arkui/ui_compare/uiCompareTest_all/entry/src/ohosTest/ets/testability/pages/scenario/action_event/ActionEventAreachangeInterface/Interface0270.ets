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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_INTERFACE_0270
 * 用例描述: 触发消失的onVisibleAreaChange回调
 * 测试条件: 安装hap
 * 测试步骤: 打开hap，点击remove node按钮，再点击add node按钮
 * 预期结果: 点击remove node按钮视频消失，再点击add node按钮视频显现并继续播放
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Interface0270 {
  @Local testLog: string[] = [];
  @Local showVideo: boolean = true;
  @Local currentRatio: number = 1;
  @Local isExpanding: boolean = true;
  @Local playStatus: string = '播放中';

  private ratios: number[] = [0, 0.5, 1];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'Interface0270', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_INTERFACE_0270')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('触发消失的onVisibleAreaChange回调')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('currentRatio')
            .fontSize(11)
          Text(`${this.currentRatio.toFixed(2)}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('isExpanding')
            .fontSize(11)
          Text(`${this.isExpanding}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.isExpanding ? Color.Green : Color.Orange)
        }
        Column() {
          Text('状态')
            .fontSize(11)
          Text(`${this.playStatus}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.showVideo ? Color.Green : Color.Red)
        }
      }

      Row({ space: 10 }) {
        Button('Remove Node')
          .onClick(() => {
            this.showVideo = false;
            this.playStatus = '已移除';
            this.addLog('点击Remove Node - 视频消失');
          })
          .fontSize(12)
          .enabled(this.showVideo)
          .id('Interface0270_RemoveBtn')

        Button('Add Node')
          .onClick(() => {
            this.showVideo = true;
            this.playStatus = '播放中';
            this.addLog('点击Add Node - 视频显现并继续播放');
          })
          .fontSize(12)
          .enabled(!this.showVideo)
          .id('Interface0270_AddBtn')
      }

      Divider().height(1).color('#EEEEEE')

      Column() {
        if (this.showVideo) {
          // 模拟视频组件
          Column() {
            Text('📹 模拟视频播放区域')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
            Text(this.playStatus)
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ top: 10 })
          }
          .width('100%')
          .height('16.39%')
          .backgroundColor('#9C27B0')
          .justifyContent(FlexAlign.Center)
          .borderRadius(8)
          .onVisibleAreaChange(this.ratios, (isVisible: boolean, currentRatio: number) => {
            this.currentRatio = currentRatio;
            this.isExpanding = isVisible;
            this.addLog(`onVisibleAreaChange: isVisible=${isVisible}, ratio=${currentRatio.toFixed(2)}`);
          })
          .id('Interface0270_Video')
        } else {
          Column() {
            Text('视频已移除')
              .fontSize(16)
              .fontColor(Color.Gray)
          }
          .width('100%')
          .height('16.39%')
          .backgroundColor('#E0E0E0')
          .justifyContent(FlexAlign.Center)
          .borderRadius(8)
        }
      }
      .width('100%')
      .padding(10)

      Divider().height(1).color('#EEEEEE')

      Text('预期:\n• Remove Node: 视频消失\n• Add Node: 视频显现并继续播放')
        .fontSize(11)
        .fontColor('#4CAF50')

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('8.2%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}

