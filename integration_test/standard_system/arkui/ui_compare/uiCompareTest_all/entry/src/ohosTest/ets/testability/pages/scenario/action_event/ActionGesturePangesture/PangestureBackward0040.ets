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
export struct PangestureBackward0040 {
  @Local parentInfo: string = '父组件：等待手势';
  @Local childInfo: string = '子组件：等待手势';
  @Local bounceStatus: string = '回弹状态：未触发';
  @Local offsetX: number = 0;
  @Local offsetY: number = 0;

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_PANGESTURE_BACKWARDANALYSIS_0040`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`1. 第一根手指点击子组件区域（白色）并滑动，之后不松手`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`2. 第二根手指点击子组件区域后抬起`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`3. 第二根手指再点击父组件区域（灰色），第一根手指松手`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：白色区域可以回弹`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.parentInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.childInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.bounceStatus)
        .fontSize(12)
        .fontColor(Color.Red)
        .width('100%')

      Divider()

      // 父组件区域（灰色）
      Column() {
        Text('父组件区域')
          .fontSize(14)
          .fontColor(Color.White)

        // 子组件区域（白色）
        Column() {
          Text('子组件区域')
            .fontSize(14)
            .fontColor(Color.Black)

          Text(`偏移: X=${this.offsetX.toFixed(0)}, Y=${this.offsetY.toFixed(0)}`)
            .fontSize(12)
            .fontColor(Color.Gray)
            .margin({ top: 10 })
        }
        .width('27.78%')
        .height('16.39%')
        .backgroundColor(Color.White)
        .justifyContent(FlexAlign.Center)
        .translate({ x: this.offsetX, y: this.offsetY })
        .animation({ duration: 300, curve: Curve.Friction })
        .parallelGesture(
          PanGesture()
            .onActionStart(() => {
              this.childInfo = '子组件：手势开始';
            })
            .onActionUpdate((event) => {
              this.offsetX += event.offsetX;
              this.offsetY += event.offsetY;
              this.childInfo = `子组件：滑动中 (${event.offsetX.toFixed(0)}, ${event.offsetY.toFixed(0)})`;
            })
            .onActionEnd(() => {
              this.childInfo = '子组件：手势结束，回弹中...';
              this.bounceStatus = '回弹状态：触发回弹动画';
              // 回弹到原位置
              this.offsetX = 0;
              this.offsetY = 0;
              setTimeout(() => {
                this.bounceStatus = '回弹状态：回弹完成';
              }, 300);
            })
        )
      }
      .width('41.67%')
      .height('24.59%')
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.Center)
      .parallelGesture(
        PanGesture()
          .onActionStart(() => {
            this.parentInfo = '父组件：手势开始';
          })
          .onActionUpdate((event) => {
            this.parentInfo = `父组件：滑动中 (${event.offsetX.toFixed(0)}, ${event.offsetY.toFixed(0)})`;
          })
          .onActionEnd(() => {
            this.parentInfo = '父组件：手势结束';
          })
      )
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

