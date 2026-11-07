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
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXT_TV_0810
 * 测试目的：跑马灯循环多次，设置回调次数无丢失
 * 预置条件：text文本超长
 * 预期结果：跑马灯回调次数无丢失
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct TextMarquee0810 {
  @Local expectedLoops: number = 100;
  @Local actualCallbacks: number = 0;
  @Local startCallbacks: number = 0;
  @Local finishCallbacks: number = 0;
  @Local testStatus: string = '待开始';
  @Local isRunning: boolean = false;

  private longText: string = '这是跑马灯测试文本，用于验证循环100次回调是否有丢失，每次循环结束都应触发FINISH回调';

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0810')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text('测试：跑马灯循环多次，回调次数无丢失')
          .fontSize(14)
          .fontColor(Color.Gray)

        Divider()

        // 统计显示
        Column({ space: 10 }) {
          Text('回调统计：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Row({ space: 20 }) {
            Column({ space: 5 }) {
              Text('预期循环')
                .fontSize(11)
                .fontColor(Color.Gray)
              Text(`${this.expectedLoops}`)
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Blue)
            }

            Column({ space: 5 }) {
              Text('START回调')
                .fontSize(11)
                .fontColor(Color.Gray)
              Text(`${this.startCallbacks}`)
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Green)
            }

            Column({ space: 5 }) {
              Text('FINISH回调')
                .fontSize(11)
                .fontColor(Color.Gray)
              Text(`${this.finishCallbacks}`)
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Orange)
            }
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)

          // 丢失检测
          if (this.finishCallbacks > 0) {
            Text(this.finishCallbacks === this.expectedLoops ?
              '✅ 回调次数完整，无丢失' :
              `⚠️ 已完成 ${this.finishCallbacks}/${this.expectedLoops} 次`)
              .fontSize(14)
              .fontColor(this.finishCallbacks === this.expectedLoops ? Color.Green : Color.Orange)
              .fontWeight(FontWeight.Bold)
          }
        }
        .width('100%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

        // 跑马灯组件
        Column({ space: 8 }) {
          Text('跑马灯组件（循环100次）：')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text(this.longText)
            .id('marqueeText')
            .width('100%')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(this.isRunning ? '#4CAF50' : '#9E9E9E')
            .padding(15)
            .borderRadius(8)
            .textOverflow({ overflow: TextOverflow.MARQUEE })
            .onMarqueeStateChange((state: MarqueeState) => {
              this.actualCallbacks++;
              
              if (state === MarqueeState.START) {
                this.startCallbacks++;
                this.isRunning = true;
                this.testStatus = '运行中...';
                hilog.info(0x0000, 'MarqueeCallback', `START callback #${this.startCallbacks}`);
              } else if (state === MarqueeState.FINISH) {
                this.finishCallbacks++;
                hilog.info(0x0000, 'MarqueeCallback', `FINISH callback #${this.finishCallbacks}`);
                
                if (this.finishCallbacks >= this.expectedLoops) {
                  this.testStatus = '✅ 测试完成';
                  this.isRunning = false;
                }
              }
            })
        }
        .width('100%')

        // 控制按钮
        Row({ space: 10 }) {
          Button('重置计数')
            .id('resetBtn')
            .backgroundColor('#FF9800')
            .onClick(() => {
              this.startCallbacks = 0;
              this.finishCallbacks = 0;
              this.actualCallbacks = 0;
              this.testStatus = '已重置';
            })

          Button('设置50次')
            .id('set50Btn')
            .onClick(() => {
              this.expectedLoops = 50;
            })

          Button('设置100次')
            .id('set100Btn')
            .onClick(() => {
              this.expectedLoops = 100;
            })
        }

        Divider()

        // 测试步骤
        Column({ space: 8 }) {
          Text('测试步骤：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('1. 编写demo使存在多个跑马灯效果')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('2. 设置回调参数，循环执行100次跑马灯')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)

          Text('3. 观察回调次数是否等于预期次数')
            .fontSize(12)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        // 状态
        Text(`状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(this.testStatus.includes('✅') ? Color.Green : Color.Blue)
          .fontWeight(FontWeight.Bold)

        // 预期结果
        Column({ space: 5 }) {
          Text('预期结果：')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('跑马灯回调次数无丢失')
            .fontSize(13)
            .fontColor(Color.Green)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}

