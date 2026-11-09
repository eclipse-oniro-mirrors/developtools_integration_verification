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
export struct SwipegestureInterface0410 {
  @Local gestureInfo: string = '等待手势';
  @Local whiteAreaSwipeCount: number = 0;
  @Local redAreaSwipeCount: number = 0;
  @Local listScrollable: boolean = true;

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_SWIPEGESTURE_INTERFACE_0410`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：滑动空白区域和红色区域`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：滑动空白区域list响应滑动，滑动红色区域list不滚动`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.gestureInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(`空白区域滑动次数：${this.whiteAreaSwipeCount}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Text(`红色区域滑动次数：${this.redAreaSwipeCount}`)
        .fontSize(12)
        .fontColor(Color.Red)
        .width('100%')

      Divider()

      List({ space: 5 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Row() {
              // 红色区域（阻止滑动）
              Column() {
                Text('红色区域\n滑动我')
                  .fontSize(12)
                  .fontColor(Color.White)
                  .textAlign(TextAlign.Center)
              }
              .width('11.11%')
              .height('4.92%')
              .backgroundColor(Color.Red)
              .justifyContent(FlexAlign.Center)
              .priorityGesture(
                SwipeGesture({ direction: SwipeDirection.Vertical })
                  .onAction((event) => {
                    this.redAreaSwipeCount++;
                    this.gestureInfo = `❌ 红色区域滑动 (不应触发list滚动)`;
                  })
              )

              // 空白区域
              Column() {
                Text(`Item ${item}`)
                  .fontSize(14)
              }
              .layoutWeight(1)
              .height('4.92%')
              .backgroundColor(Color.White)
              .justifyContent(FlexAlign.Center)
              .gesture(
                SwipeGesture({ direction: SwipeDirection.Vertical })
                  .onAction((event) => {
                    this.whiteAreaSwipeCount++;
                    this.gestureInfo = `✅ 空白区域滑动 (list应滚动)`;
                  })
              )
            }
            .width('100%')
            .height('4.92%')
          }
        })
      }
      .width('100%')
      .height('32.79%')
      .backgroundColor('#F0F0F0')
      .divider({ strokeWidth: 1, color: Color.Gray })

      Text(`提示：在红色区域滑动时list不滚动，在空白区域滑动时list滚动`)
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

