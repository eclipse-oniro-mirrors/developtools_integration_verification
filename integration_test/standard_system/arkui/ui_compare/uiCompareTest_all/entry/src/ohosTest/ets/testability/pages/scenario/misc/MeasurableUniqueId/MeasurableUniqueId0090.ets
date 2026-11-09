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
struct MeasurableUniqueId0090 {
  @State logText: string = '日志输出:\n'
  @State childNodes: number[] = [0, 1, 2, 3, 4, 5, 6, 7]

  build() {
    Column() {
      Text('MeasurableUniqueId0090测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('正确获取占位子组件的FrameNode，在第六个节点后添加子节点')
        .fontSize(14)
        .margin({ bottom: 20 })

      // 容器 - 包含多个子组件
      Column() {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
          ForEach(this.childNodes, (index: number) => {
            Column() {
              Text(`${index + 1}`)
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('6.94%')
            .height('4.1%')
            .backgroundColor(this.getChildColor(index))
            .justifyContent(FlexAlign.Center)
            .margin(5)
          })
        }
      }
      .id('node_container_main')
      .width('48.61%')
      .height('16.39%')
      .backgroundColor('#FFA07A')
      .margin({ bottom: 20 })
      .padding(10)

      Button('在第六个节点后添加子节点')
        .id('insert_child_node_button')
        .onClick(() => {
          this.insertChildNodeAfterSixth()
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
    .backgroundColor('#FFA07A')
  }

  getChildColor(index: number): Color {
    let colors: Color[] = [Color.Blue, Color.Green, Color.Yellow, Color.Black, Color.Pink, Color.Orange, Color.Yellow, Color.Gray]
    if (index < colors.length) {
      return colors[index]
    }
    return Color.Red // 新添加的节点为红色
  }

  insertChildNodeAfterSixth(): void {
    try {
      let frameNode = this.getUIContext()?.getFrameNodeById('node_container_main')
      if (frameNode) {
        let uniqueId: number = frameNode.getUniqueId()
        
        if (this.childNodes.length >= 6) {
          // 在第六个节点后插入新节点
          let newIndex: number = this.childNodes.length
          this.childNodes.splice(6, 0, newIndex) // 在索引6处插入
          
          let insertLog: string = `在第六个橘色方块后插入了红色方块，当前子节点总数: ${this.childNodes.length}`
          console.log(insertLog)
          this.logText += insertLog + '\n'
        } else {
          let errorLog: string = `当前子节点数量不足6个，无法在第六个节点后插入，当前数量: ${this.childNodes.length}`
          console.log(errorLog)
          this.logText += errorLog + '\n'
        }
      }
    } catch (error) {
      let errorMessage: string = `插入子节点失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
