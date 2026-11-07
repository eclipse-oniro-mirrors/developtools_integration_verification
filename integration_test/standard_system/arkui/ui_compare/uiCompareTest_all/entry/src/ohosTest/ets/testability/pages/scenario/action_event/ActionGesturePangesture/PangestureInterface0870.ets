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
export struct PangestureInterface0870 {
  @Local gestureInfo: string = '等待手势';
  @Local isButton1Visible: boolean = true;
  @Local callbackCount: number = 0;
  @Local isPanning: boolean = false;

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_PANGESTURE_INTUREFACE_0870`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`1. 在button1上进行平移操作`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`2. 平移过程中点击button2按钮（使button1下树）`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：点击button2按钮后pan手势的回调还可以触发`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.gestureInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(`手势回调触发次数：${this.callbackCount}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Text(`Button1可见性：${this.isButton1Visible ? '显示' : '隐藏(下树)'}`)
        .fontSize(12)
        .fontColor(Color.Red)
        .width('100%')

      Divider()

      if (this.isButton1Visible) {
        Button('Button1\n请在我上面滑动')
          .id('btn1')
          .width(200)
          .height(150)
          .fontSize(16)
          .backgroundColor('#4CAF50')
          .margin({ top: 20 })
          .gesture(
            PanGesture()
              .onActionStart(() => {
                this.isPanning = true;
                this.callbackCount++;
                this.gestureInfo = `✅ Button1手势开始 (回调${this.callbackCount})`;
              })
              .onActionUpdate((event) => {
                this.callbackCount++;
                this.gestureInfo = `✅ Button1滑动中: (${event.offsetX.toFixed(0)}, ${event.offsetY.toFixed(0)}) (回调${this.callbackCount})`;
              })
              .onActionEnd(() => {
                this.callbackCount++;
                this.gestureInfo = `✅ Button1手势结束 (回调${this.callbackCount})`;
                this.isPanning = false;
              })
              .onActionCancel(() => {
                this.callbackCount++;
                this.gestureInfo = `✅ Button1手势取消 (回调${this.callbackCount})`;
                this.isPanning = false;
              })
          )
      }

      Button('Button2\n点击使Button1下树')
        .id('btn2')
        .width(200)
        .height(100)
        .fontSize(14)
        .backgroundColor('#FF9800')
        .margin({ top: 20 })
        .onClick(() => {
          const wasVisible = this.isButton1Visible;
          this.isButton1Visible = !this.isButton1Visible;
          
          if (wasVisible && this.isPanning) {
            this.gestureInfo += '\n⚠️ Button1已下树，但手势回调应继续触发';
          }
        })

      Text(`提示：在Button1上滑动时，点击Button2使其下树，观察回调计数是否继续增加`)
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

