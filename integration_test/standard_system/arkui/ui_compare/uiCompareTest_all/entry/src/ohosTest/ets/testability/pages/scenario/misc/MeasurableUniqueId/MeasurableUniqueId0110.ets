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
struct MeasurableUniqueId0110 {
  @State logText: string = '日志输出:\n'
  @State childNodes: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  @State showChildren: boolean = true

  build() {
    Column() {
      Text('MeasurableUniqueId0110测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('正确获取占位子组件的FrameNode，清除所有子节点')
        .fontSize(14)
        .margin({ bottom: 20 })

      // 容器 - 包含多个子组件
      Column() {
        if (this.showChildren) {
          Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
            ForEach(this.childNodes, (index: number) => {
              Column() {
                Text(`${index + 1}`)
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .width('6.94%')
              .height('4.1%')
              .backgroundColor(Color.Orange)
              .justifyContent(FlexAlign.Center)
              .margin(5)
            })
          }
        }
      }
      .id('node_container_main')
      .width('48.61%')
      .height('20.49%')
      .backgroundColor('#E6E6FA')
      .margin({ bottom: 20 })
      .padding(10)

      Button('清除所有子节点')
        .id('clear_all_children_button')
        .onClick(() => {
          this.clearAllChildren()
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
    .backgroundColor('#E6E6FA')
  }

  clearAllChildren(): void {
    try {
      let frameNode = this.getUIContext()?.getFrameNodeById('node_container_main')
      if (frameNode) {
        let uniqueId: number = frameNode.getUniqueId()
        
        if (this.childNodes.length > 0) {
          let originalCount: number = this.childNodes.length
          // 清除所有子节点
          this.childNodes = []
          this.showChildren = false
          
          let clearLog: string = `清除了所有子节点，原有子节点数量: ${originalCount}，清除后数量: 0`
          console.log(clearLog)
          this.logText += clearLog + '\n'
        } else {
          let errorLog: string = `没有子节点需要清除`
          console.log(errorLog)
          this.logText += errorLog + '\n'
        }
      }
    } catch (error) {
      let errorMessage: string = `清除子节点失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
