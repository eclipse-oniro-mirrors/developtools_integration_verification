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

/**
 * 端到端验证，通过dump命令看节点树，Common节点不创建CanvasNode且Common节点的上一层的CanvasNode的child直接是Common节点下一层的CanvasNode
 * SUB_ACE_TOOLCHAIN_COMMONIMPROVE_0030
 */
@Entry
@ComponentV2
export struct ToolchainCommonimprove0030 {
  @Local logs: string[] = [];

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 20) {
      this.logs = this.logs.slice(0, 20);
    }
  }

  aboutToAppear(): void {
    this.addLog('页面加载完成');
  }

  build() {
    Scroll() {
      Column() {
        Text('端到端验证，通过dump命令看节点树，Common节点不创建CanvasNode且Common节点的上一层的CanvasNode的child直接是Common节点下一层的CanvasNode')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_TOOLCHAIN_COMMONIMPROVE_0030')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 10 })

        Text('测试步骤：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`1、执行获取arkui控件节点树.bat文件\n2、输入当前应用窗口号\n3、观察第一个Common节点是否创建CanvasNode`)
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`3、第一个Common节点不创建CanvasNode【无CanvasNode[xx][xx]代码显示】`)
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })
          .fontColor('#FF6B35')

        Button('开始测试')
          .width('80%')
          .margin({ top: 15, bottom: 10 })
          .id('btn')
          .onClick(() => {
            this.addLog('✅ 测试按钮已点击');
          })

        Text('测试日志：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(9)
              .padding(5)
              .width('100%')
              .backgroundColor(log.includes('✅') ? '#e8f5e9' : '#f5f5f5')
              .margin({ bottom: 2 })
          })
        }
        .width('95%')
        .height('9.84%')
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .padding(5)
        .margin({ top: 5 })

        Text('说明: 本用例为UI对比测试，请按照测试步骤进行手动操作')
          .fontSize(9)
          .fontColor('#999')
          .margin({ top: 10 })
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}
