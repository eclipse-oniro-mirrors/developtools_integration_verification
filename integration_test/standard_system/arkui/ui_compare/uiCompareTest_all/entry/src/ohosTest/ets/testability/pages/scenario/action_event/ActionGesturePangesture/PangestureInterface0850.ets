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

@Entry
@ComponentV2
export struct PangestureInterface0850 {
  @Local gestureInfo: string = '等待手势';
  @Local horizontalCount: number = 0;
  @Local verticalCount: number = 0;

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0850`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`在button上上下左右进行平移操作`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：左右滑动事件触发，上下滑动事件不触发`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`参数配置：`)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`direction = PanDirection.Vertical & PanDirection.Left & PanDirection.Down | PanDirection.Horizontal`)
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('100%')
        .margin({ left: 10 })

      Divider()

      Text(this.gestureInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(`水平滑动触发次数：${this.horizontalCount}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Text(`垂直滑动触发次数：${this.verticalCount}`)
        .fontSize(12)
        .fontColor(Color.Red)
        .width('100%')

      Divider()

      Button('测试按钮\n请尝试上下左右滑动')
        .id('btn')
        .width(200)
        .height(200)
        .fontSize(16)
        .backgroundColor('#4CAF50')
        .margin({ top: 20 })
        .gesture(
          PanGesture({ direction: PanDirection.Vertical & PanDirection.Left & PanDirection.Down | PanDirection.Horizontal })
            .onActionStart((event) => {
              this.gestureInfo = `手势开始: fingers=${event.fingerList.length}`;
            })
            .onActionUpdate((event) => {
              const absX = Math.abs(event.offsetX);
              const absY = Math.abs(event.offsetY);
              
              if (absX > absY) {
                // 水平滑动
                this.horizontalCount++;
                this.gestureInfo = `✅ 水平滑动: offsetX=${event.offsetX.toFixed(0)}`;
              } else {
                // 垂直滑动
                this.verticalCount++;
                this.gestureInfo = `❌ 垂直滑动: offsetY=${event.offsetY.toFixed(0)}`;
              }
            })
            .onActionEnd(() => {
              this.gestureInfo = '手势结束';
            })
        )

      Text(`提示：左右滑动应触发（计数增加），上下滑动不应触发`)
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('100%')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

