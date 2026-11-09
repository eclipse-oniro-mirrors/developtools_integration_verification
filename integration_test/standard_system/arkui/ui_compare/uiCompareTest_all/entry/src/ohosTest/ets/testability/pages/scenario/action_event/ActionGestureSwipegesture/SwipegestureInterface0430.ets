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
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'SwipegestureInterface0430';

@Entry
@ComponentV2
export struct SwipegestureInterface0430 {
  @Local gestureInfo: string = '等待手势';
  @Local historyCount: number = 0;

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0430`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`1. 打开demo`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`2. 滑动按钮`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`3. 查看日志（过滤：onTouch history|inputkeyflow）`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：每次的history中存多个的场景，且和多模报点一致`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.gestureInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(`历史点记录次数：${this.historyCount}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Divider()

      Button('测试按钮\n请滑动')
        .id('btn')
        .width(200)
        .height(150)
        .fontSize(16)
        .backgroundColor('#4CAF50')
        .margin({ top: 20 })
        .onTouch((event) => {
          if (event.type === TouchType.Down) {
            this.gestureInfo = `TouchDown: x=${event.touches[0].x.toFixed(0)}, y=${event.touches[0].y.toFixed(0)}`;
            hilog.info(0x0000, TAG, `onTouch history: TouchDown at (${event.touches[0].x.toFixed(0)}, ${event.touches[0].y.toFixed(0)})`);
          } else if (event.type === TouchType.Move) {
            this.historyCount++;
            const touch = event.touches[0];
            this.gestureInfo = `TouchMove ${this.historyCount}: x=${touch.x.toFixed(0)}, y=${touch.y.toFixed(0)}`;
            
            // 记录历史点坐标
            if (event.touches.length > 0) {
              let historyInfo = `onTouch history [Move ${this.historyCount}]: `;
              event.touches.forEach((t, idx) => {
                historyInfo += `point${idx}=(${t.x.toFixed(0)},${t.y.toFixed(0)}) `;
              });
              hilog.info(0x0000, TAG, historyInfo);
            }
          } else if (event.type === TouchType.Up) {
            this.gestureInfo = `TouchUp: 总共记录${this.historyCount}个历史点`;
            hilog.info(0x0000, TAG, `onTouch history: TouchUp, total history points=${this.historyCount}`);
          }
        })
        .gesture(
          SwipeGesture({ direction: SwipeDirection.All })
            .onAction((event) => {
              const angle = event.angle;
              const speed = event.speed;
              this.gestureInfo += `\nSwipe: angle=${angle.toFixed(0)}°, speed=${speed.toFixed(2)}`;
              hilog.info(0x0000, TAG, `SwipeGesture: angle=${angle}, speed=${speed}`);
            })
        )

      Text(`提示：滑动按钮，查看控制台日志中的历史点坐标信息`)
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('100%')
        .margin({ top: 10 })

      Text(`日志过滤关键字：onTouch history`)
        .fontSize(11)
        .fontColor(Color.Blue)
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

