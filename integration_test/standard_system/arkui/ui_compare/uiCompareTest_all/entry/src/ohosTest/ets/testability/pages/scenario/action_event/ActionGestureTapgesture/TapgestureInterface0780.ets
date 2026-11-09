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
export struct TapgestureInterface0780 {
  @Local gestureInfo: string = '等待操作';
  @Local textClickCount: number = 0;
  @Local isScrolling: boolean = false;

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_TAPGESTURE_0780`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`1. 运行demo`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`2. 左手滑动scroll且不离开屏幕，右手点击scroll的子组件text`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：text的onclick事件不会被触发`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.gestureInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(`Text点击次数：${this.textClickCount}`)
        .fontSize(12)
        .fontColor(this.textClickCount > 0 ? Color.Red : Color.Blue)
        .width('100%')

      Text(`Scroll状态：${this.isScrolling ? '滑动中' : '静止'}`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .width('100%')

      Divider()

      Scroll() {
        Column({ space: 5 }) {
          ForEach(this.arr, (item: number) => {
            Text(`可点击Text ${item}\n(滑动时点击不应触发)`)
              .width('100%')
              .height(80)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
              .borderRadius(5)
              .onClick(() => {
                this.textClickCount++;
                this.gestureInfo = `❌ Text ${item}被点击了 (不符合预期！)`;
              })
          })
        }
        .width('100%')
        .padding(10)
      }
      .width('100%')
      .height('32.79%')
      .backgroundColor('#E0E0E0')
      .scrollable(ScrollDirection.Vertical)
      .onScroll(() => {
        this.isScrolling = true;
        this.gestureInfo = '✅ Scroll正在滑动中...';
      })
      .onScrollStop(() => {
        this.isScrolling = false;
        this.gestureInfo = 'Scroll已停止';
      })
      .onTouch((event) => {
        if (event.type === TouchType.Down) {
          this.gestureInfo = 'Touch Down on Scroll';
        } else if (event.type === TouchType.Move) {
          this.isScrolling = true;
        } else if (event.type === TouchType.Up) {
          setTimeout(() => {
            this.isScrolling = false;
          }, 100);
        }
      })

      Text(`提示：用一只手滑动Scroll不离手，另一只手点击Text，Text不应被触发`)
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

