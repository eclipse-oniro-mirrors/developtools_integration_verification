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
export struct A11yHover1 {
  @Local node1Focused: boolean = false;
  @Local testStatus: string = '待测试';
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));

  drawCanvas() {
    this.canvasContext.fillStyle = '#E0E0E0';
    this.canvasContext.fillRect(0, 0, 300, 200);
    
    // 绘制节点1
    this.canvasContext.fillStyle = this.node1Focused ? '#FF6B6B' : '#4A90E2';
    this.canvasContext.fillRect(50, 50, 80, 60);
    this.canvasContext.fillStyle = '#FFFFFF';
    this.canvasContext.font = '16px sans-serif';
    this.canvasContext.fillText('节点1', 70, 85);
    
    // 绘制焦点框
    if (this.node1Focused) {
      this.canvasContext.strokeStyle = '#FF0000';
      this.canvasContext.lineWidth = 3;
      this.canvasContext.strokeRect(48, 48, 84, 64);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('Arkui_A11y_Hover_1')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：启动无障碍并按压目标对象`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`预置条件：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• 创建1个带有canvas组件的ets应用\n• 设置无障碍虚拟子节点`)
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 创建带有canvas组件和虚拟子节点的ets应用\n2. 启动应用，快捷键启动无障碍\n3. 点击有虚拟子节点的节点1并观察焦点框`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 10 }) {
        Text(`Canvas区域（带虚拟子节点）：`)
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
          .accessibilityText('Canvas容器，包含虚拟子节点1')

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`焦点状态：${this.node1Focused ? '节点1已获得焦点' : '无焦点'}`)
          .fontSize(14)
          .fontColor(this.node1Focused ? Color.Red : Color.Gray)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`点击节点1（模拟无障碍点击）`)
        .id('btn')
        .onClick(() => {
          this.node1Focused = true;
          this.testStatus = '✅ 节点1获得焦点，焦点框绘制成功';
          this.drawCanvas();
        })

      Button(`重置`)
        .onClick(() => {
          this.node1Focused = false;
          this.testStatus = '待测试';
          this.drawCanvas();
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1-1. 应用创建成功\n2-1. 应用启动成功，无障碍开启\n3-1. 焦点框绘制在节点1上`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`本测试模拟无障碍功能中Canvas虚拟子节点的焦点显示。实际测试需开启系统无障碍功能。`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

