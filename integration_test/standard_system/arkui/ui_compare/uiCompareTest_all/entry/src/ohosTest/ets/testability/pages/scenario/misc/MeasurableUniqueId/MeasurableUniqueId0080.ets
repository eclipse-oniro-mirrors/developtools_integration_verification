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
@Component
struct MeasurableUniqueId0080 {
  @State logText: string = '日志输出:\n'
  @State childNodes: number[] = [0, 1, 2]

  build() {
    Column() {
      Text('MeasurableUniqueId0080测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('正确获取占位子组件的FrameNode，在末尾添加子节点')
        .fontSize(14)
        .margin({ bottom: 20 })

      // 容器 - 包含多个子组件
      Column() {
        Row() {
          ForEach(this.childNodes, (index: number) => {
            Column() {
              Text(`子${index + 1}`)
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('6.94%')
            .height('4.1%')
            .backgroundColor(index < 3 ? (index === 0 ? Color.Blue : index === 1 ? Color.Green : Color.Yellow) : Color.Red)
            .justifyContent(FlexAlign.Center)
            .margin(5)
          })
        }
        .justifyContent(FlexAlign.Start)
        .width('100%')
      }
      .id('node_container_main')
      .width('41.67%')
      .height('8.2%')
      .backgroundColor('#E6E6FA')
      .margin({ bottom: 20 })
      .justifyContent(FlexAlign.Center)

      Button('在末尾添加子节点')
        .id('add_child_node_button')
        .onClick(() => {
          this.addChildNodeToEnd()
        })
        .margin({ bottom: 20 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .id('log_text')
          .fontSize(12)
          .fontColor(Color.Black)
          .width('100%')
          .padding(10)
          .backgroundColor(Color.White)
          .border({ width: 1, color: Color.Gray })
      }
      .width('100%')
      .height('16.39%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFB6C1')
  }

  addChildNodeToEnd(): void {
    try {
      let frameNode = this.getUIContext()?.getFrameNodeById('node_container_main')
      if (frameNode) {
        let uniqueId: number = frameNode.getUniqueId()
        
        // 在末尾添加新的子节点
        let newIndex: number = this.childNodes.length
        this.childNodes.push(newIndex)
        
        let addLog: string = `在末尾添加了红色方块子节点，位置: ${newIndex + 1}，当前子节点总数: ${this.childNodes.length}`
        console.log(addLog)
        this.logText += addLog + '\n'
      }
    } catch (error) {
      let errorMessage: string = `添加子节点失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
