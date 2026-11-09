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
export struct A11yHover8 {
  @Local node1X: number = 50;
  @Local node1Y: number = 50;
  @Local node1Focused: boolean = false;
  @Local testStatus: string = '待测试';
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));

  drawCanvas() {
    // 清空画布
    this.canvasContext.clearRect(0, 0, 300, 200);
    this.canvasContext.fillStyle = '#E0E0E0';
    this.canvasContext.fillRect(0, 0, 300, 200);
    
    // 绘制节点1（位置可变）
    this.canvasContext.fillStyle = this.node1Focused ? '#FF6B6B' : '#4A90E2';
    this.canvasContext.fillRect(this.node1X, this.node1Y, 80, 60);
    this.canvasContext.fillStyle = '#FFFFFF';
    this.canvasContext.font = '16px sans-serif';
    this.canvasContext.fillText('节点1', this.node1X + 20, this.node1Y + 35);
    
    // 绘制焦点框
    if (this.node1Focused) {
      this.canvasContext.strokeStyle = '#FF0000';
      this.canvasContext.lineWidth = 3;
      this.canvasContext.strokeRect(this.node1X - 2, this.node1Y - 2, 84, 64);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('Arkui_A11y_Hover_8')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：动态改变虚拟子节点中的x值`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 10 }) {
        Text(`Canvas区域：`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Canvas(this.canvasContext)
          .width(300)
          .height(200)
          .backgroundColor('#F0F0F0')
          .onReady(() => {
            this.drawCanvas();
          })
          .accessibilityGroup(true)
          .accessibilityText('Canvas容器，节点1位置可变')

        Text(`节点1位置：X=${this.node1X}, Y=${this.node1Y}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Orange)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`change X（改变节点1的X坐标）`)
        .id('btn')
        .onClick(() => {
          this.node1X = this.node1X + 50;
          if (this.node1X > 200) {
            this.node1X = 50;
          }
          this.testStatus = `✅ X坐标已改变为${this.node1X}`;
          this.drawCanvas();
        })

      Button(`划动焦点框到节点1`)
        .onClick(() => {
          this.node1Focused = true;
          this.testStatus = `✅ 焦点框绘制在新位置（X=${this.node1X}）`;
          this.drawCanvas();
        })

      Button(`重置`)
        .onClick(() => {
          this.node1X = 50;
          this.node1Y = 50;
          this.node1Focused = false;
          this.testStatus = '待测试';
          this.drawCanvas();
        })

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 创建带有canvas组件和虚拟子节点的ets应用\n2. 启动应用\n3. 双击change X按键，划动焦点框到节点1`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1-1. 应用创建成功\n2-1. 应用启动成功\n3-1. 焦点框绘制在原位置的右面`)
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

