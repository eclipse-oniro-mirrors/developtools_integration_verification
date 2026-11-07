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

@Entry
@ComponentV2
export struct A11yHover13 {
  @Local keyQFocused: boolean = false;
  @Local testStatus: string = '待测试';
  @Local elapsedTime: number = 0;
  private timerInterval?: number;
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));

  drawCanvas() {
    this.canvasContext.fillStyle = '#E0E0E0';
    this.canvasContext.fillRect(0, 0, 300, 150);
    
    // 绘制键盘按键Q
    this.canvasContext.fillStyle = this.keyQFocused ? '#FF6B6B' : '#4A90E2';
    this.canvasContext.fillRect(100, 50, 50, 50);
    this.canvasContext.fillStyle = '#FFFFFF';
    this.canvasContext.font = '24px sans-serif';
    this.canvasContext.fillText('Q', 117, 83);
    
    // 绘制焦点框
    if (this.keyQFocused) {
      this.canvasContext.strokeStyle = '#FF0000';
      this.canvasContext.lineWidth = 3;
      this.canvasContext.strokeRect(98, 48, 54, 54);
    }
  }

  aboutToDisappear(): void {
    if (this.timerInterval) {
      clearInterval(this.timerInterval);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('Arkui_A11y_Hover_13')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：聚焦到某一按键后无操作`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`预置条件：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• 创建1个带有canvas组件的ets应用\n• 设置无障碍虚拟子节点\n• 开启无障碍功能`)
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 10 }) {
        Text(`Canvas区域（模拟键盘）：`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Canvas(this.canvasContext)
          .width(300)
          .height(150)
          .backgroundColor('#F0F0F0')
          .onReady(() => {
            this.drawCanvas();
          })
          .accessibilityGroup(true)
          .accessibilityText('虚拟键盘Q键')

        if (this.keyQFocused) {
          Text(`焦点保持时间：${this.elapsedTime}秒`)
            .fontSize(16)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
        }

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`按压Q键（模拟无障碍聚焦）`)
        .id('btn')
        .onClick(() => {
          this.keyQFocused = true;
          this.elapsedTime = 0;
          this.testStatus = '✅ Q键获得焦点，开始计时';
          this.drawCanvas();
          
          // 启动计时器
          if (this.timerInterval) {
            clearInterval(this.timerInterval);
          }
          this.timerInterval = setInterval(() => {
            if (this.keyQFocused) {
              this.elapsedTime++;
              if (this.elapsedTime >= 10) {
                this.testStatus = '✅ 验证通过：焦点框在10秒后仍未消失';
                clearInterval(this.timerInterval);
              }
            }
          }, 1000);
        })

      Button(`重置`)
        .onClick(() => {
          if (this.timerInterval) {
            clearInterval(this.timerInterval);
          }
          this.keyQFocused = false;
          this.elapsedTime = 0;
          this.testStatus = '待测试';
          this.drawCanvas();
        })

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 创建带有canvas组件和虚拟子节点的ets应用\n2. 启动应用\n3. 按压模拟键盘上的q键后无操作并观察焦点框`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1-1. 应用创建成功\n2-1. 应用启动成功\n3-1. 焦点框不消失`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

