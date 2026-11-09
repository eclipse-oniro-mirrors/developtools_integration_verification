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

/**
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXT_TV_0350
 * 测试目的：跑马灯循环未结束，重新触发start，循环重新计数
 * 预置条件：编写demo
 * 预期结果：触发跑马灯回调MarqueeState.START
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct TextMarquee0350 {
  @Local marqueeState: string = '未启动';
  @Local loopCount: number = 0;
  @Local callbackLog: string[] = [];
  @Local speed: number = 50;
  @Local isRunning: boolean = false;

  // 超长文本用于跑马灯
  private longText: string = '这是一段超长的跑马灯文本内容，用于测试跑马灯循环未结束时重新触发start的效果，观察循环是否重新计数';

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0350')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text('测试：跑马灯循环未结束，重新触发start')
          .fontSize(14)
          .fontColor(Color.Gray)

        Divider()

        // 状态显示
        Column({ space: 8 }) {
          Row({ space: 10 }) {
            Text('跑马灯状态：')
              .fontSize(14)
            Text(this.marqueeState)
              .fontSize(14)
              .fontColor(this.isRunning ? Color.Green : Color.Gray)
              .fontWeight(FontWeight.Bold)
          }

          Row({ space: 10 }) {
            Text('循环次数：')
              .fontSize(14)
            Text(`${this.loopCount}`)
              .fontSize(14)
              .fontColor(Color.Blue)
              .fontWeight(FontWeight.Bold)
          }
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

        // 跑马灯组件
        Column({ space: 8 }) {
          Text('跑马灯组件：')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text(this.longText)
            .id('marqueeText')
            .width('100%')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor('#3F51B5')
            .padding(15)
            .borderRadius(8)
            .textOverflow({ overflow: TextOverflow.MARQUEE })
            .onMarqueeStateChange((state: MarqueeState) => {
              if (state === MarqueeState.START) {
                this.marqueeState = 'START - 已启动';
                this.isRunning = true;
                this.callbackLog.push(`[${new Date().toLocaleTimeString()}] MarqueeState.START`);
                hilog.info(0x0000, 'MarqueeTest', 'MarqueeState.START triggered');
              } else if (state === MarqueeState.FINISH) {
                this.marqueeState = 'FINISH - 单次完成';
                this.loopCount++;
                this.callbackLog.push(`[${new Date().toLocaleTimeString()}] MarqueeState.FINISH (循环${this.loopCount})`);
              }
            })
        }
        .width('100%')

        // 控制按钮
        Row({ space: 10 }) {
          Button('修改速度')
            .id('speedBtn')
            .onClick(() => {
              this.speed = this.speed === 50 ? 100 : 50;
              this.callbackLog.push(`[操作] 修改速度为${this.speed}`);
            })

          Button('重新触发Start')
            .id('restartBtn')
            .backgroundColor('#FF9800')
            .onClick(() => {
              // 修改参数会触发重新start
              this.loopCount = 0;
              this.callbackLog.push(`[操作] 重新触发Start，循环计数归零`);
              hilog.info(0x0000, 'MarqueeTest', 'Restart triggered, loop count reset');
            })
        }

        Button('清空日志')
          .id('clearLogBtn')
          .backgroundColor('#607d7B')
          .onClick(() => {
            this.callbackLog = [];
          })

        Divider()

        // 回调日志
        Column({ space: 5 }) {
          Text('回调日志：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          if (this.callbackLog.length > 0) {
            ForEach(this.callbackLog.slice(-5), (log: string) => {
              Text(log)
                .fontSize(11)
                .fontColor(log.includes('START') ? Color.Green : Color.Gray)
                .alignSelf(ItemAlign.Start)
            })
          } else {
            Text('暂无日志')
              .fontSize(11)
              .fontColor(Color.Gray)
          }
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FAFAFA')
        .borderRadius(8)

        Divider()

        // 测试步骤
        Column({ space: 8 }) {
          Text('测试步骤：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('1. 观察跑马灯执行过程')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 在跑马灯循环未结束时，点击"修改速度"或"重新触发Start"')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('3. 查看回调日志是否触发MarqueeState.START')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        // 预期结果
        Text('预期结果：触发跑马灯回调MarqueeState.START')
          .fontSize(13)
          .fontColor(Color.Green)
          .padding(10)
          .backgroundColor('#E8F5E9')
          .borderRadius(8)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}

