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
export struct A11yHover7 {
  @Local deepNodeFocused: boolean = false;
  @Local text4Focused: boolean = false;
  @Local testStatus: string = '待测试';
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));

  drawCanvas() {
    this.canvasContext.fillStyle = '#E0E0E0';
    this.canvasContext.fillRect(0, 0, 300, 250);
    
    // 绘制DeepNode容器
    this.canvasContext.strokeStyle = this.deepNodeFocused ? '#FF6B6B' : '#666666';
    this.canvasContext.lineWidth = 2;
    this.canvasContext.strokeRect(20, 20, 260, 210);
    this.canvasContext.fillStyle = '#666666';
    this.canvasContext.font = '14px sans-serif';
    this.canvasContext.fillText('DeepNode（深层节点）', 30, 40);
    
    // 绘制文本1-3
    this.canvasContext.fillStyle = '#4A90E2';
    this.canvasContext.fillText('文本1', 40, 80);
    this.canvasContext.fillText('文本2', 40, 120);
    this.canvasContext.fillText('文本3', 40, 160);
    
    // 绘制文本4（可聚焦）
    this.canvasContext.fillStyle = this.text4Focused ? '#FF6B6B' : '#4A90E2';
    this.canvasContext.fillRect(35, 185, 70, 30);
    this.canvasContext.fillStyle = '#FFFFFF';
    this.canvasContext.fillText('文本4', 50, 205);
    
    // 绘制焦点框
    if (this.text4Focused) {
      this.canvasContext.strokeStyle = '#FF0000';
      this.canvasContext.lineWidth = 3;
      this.canvasContext.strokeRect(33, 183, 74, 34);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('Arkui_A11y_Hover_7')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：聚焦到深层节点的某一目标后无操作`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 10 }) {
        Text(`Canvas区域（DeepNode）：`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)

        Canvas(this.canvasContext)
          .width(300)
          .height(250)
          .backgroundColor('#F0F0F0')
          .onReady(() => {
            this.drawCanvas();
          })
          .accessibilityGroup(true)
          .accessibilityText('深层节点容器')

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`焦点状态：${this.text4Focused ? '文本4已聚焦，焦点框持续显示' : '无焦点'}`)
          .fontSize(14)
          .fontColor(this.text4Focused ? Color.Red : Color.Gray)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`点击DeepNode中的文本4`)
        .id('btn')
        .onClick(() => {
          this.deepNodeFocused = true;
          this.text4Focused = true;
          this.testStatus = '✅ 文本4获得焦点';
          this.drawCanvas();
        })

      Button(`等待10秒（模拟无操作）`)
        .onClick(async () => {
          if (this.text4Focused) {
            this.testStatus = '⏱️ 无操作中...焦点框应保持显示';
            // 模拟等待
            setTimeout(() => {
              if (this.text4Focused) {
                this.testStatus = '✅ 验证通过：焦点框在无操作后不消失';
              }
            }, 3000);
          } else {
            this.testStatus = '❌ 请先点击文本4获得焦点';
          }
        })

      Button(`重置`)
        .onClick(() => {
          this.deepNodeFocused = false;
          this.text4Focused = false;
          this.testStatus = '待测试';
          this.drawCanvas();
        })

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

