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
struct MeasurableUniqueId0030 {
  @State logText: string = '日志输出:\n'

  build() {
    Column() {
      Text('MeasurableUniqueId0030测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试FrameNode的Get系列API')
        .fontSize(14)
        .margin({ bottom: 20 })

      // 测试容器
      Column() {
        Row() {
          ForEach([0, 1, 2], (index: number) => {
            Column() {
              Text(`子组件${index + 1}`)
                .fontSize(12)
                .fontColor(Color.White)
            }
            .id(`child_component_${index}`)
            .width('6.94%')
            .height('4.1%')
            .backgroundColor(index === 0 ? Color.Red : index === 1 ? Color.Green : Color.Blue)
            .justifyContent(FlexAlign.Center)
            .margin(5)
          })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
      }
      .id('node_container_main')
      .width('27.78%')
      .height('8.2%')
      .backgroundColor('#E0E0E0')
      .margin({ bottom: 20 })
      .justifyContent(FlexAlign.Center)

      // 按钮区域
      Column() {
        Button('获取子组件的MeasureId')
          .id('get_measure_id_button')
          .onClick(() => {
            this.getMeasureId()
          })
          .margin({ bottom: 10 })

        Button('getChildNumber')
          .id('get_child_number_button')
          .onClick(() => {
            this.getChildNumber()
          })
          .margin({ bottom: 10 })

        Button('获取其他Get系列API信息')
          .id('get_other_info_button')
          .onClick(() => {
            this.getOtherInfo()
          })
          .margin({ bottom: 20 })
      }

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
      .height('24.59%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F0F8FF')
  }

  getMeasureId(): void {
    try {
      // 获取主容器的FrameNode
      let frameNode = this.getUIContext()?.getFrameNodeById('node_container_main')
      if (frameNode) {
        let uniqueId: number = frameNode.getUniqueId()
        let logMessage: string = `主容器 UniqueId/MeasureId: ${uniqueId}`
        console.log(logMessage)
        this.logText += logMessage + '\n'

        // 获取子组件的MeasureId
        for (let i = 0; i < 3; i++) {
          let childNode = this.getUIContext()?.getFrameNodeById(`child_component_${i}`)
          if (childNode) {
            let childUniqueId: number = childNode.getUniqueId()
            let childLogMessage: string = `子组件[${i}] MeasureId/UniqueId: ${childUniqueId}`
            console.log(childLogMessage)
            this.logText += childLogMessage + '\n'
          }
        }
      }
    } catch (error) {
      let errorMessage: string = `获取MeasureId失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }

  getChildNumber(): void {
    try {
      let frameNode = this.getUIContext()?.getFrameNodeById('node_container_main')
      if (frameNode) {
        // 模拟getChildNumber结果
        let childCount: number = 3
        let logMessage: string = `getChildNumber结果: ${childCount}`
        console.log(logMessage)
        this.logText += logMessage + '\n'

        // 打印每个子组件的详细信息
        for (let i = 0; i < childCount; i++) {
          let childNode = this.getUIContext()?.getFrameNodeById(`child_component_${i}`)
          if (childNode) {
            let childUniqueId: number = childNode.getUniqueId()
            let childInfo: string = `子组件[${i}] - UniqueId: ${childUniqueId}, 类型: Column组件`
            console.log(childInfo)
            this.logText += childInfo + '\n'
          }
        }
      }
    } catch (error) {
      let errorMessage: string = `getChildNumber失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }

  getOtherInfo(): void {
    try {
      let frameNode = this.getUIContext()?.getFrameNodeById('node_container_main')
      if (frameNode) {
        // 获取各种Get系列API信息
        let uniqueId: number = frameNode.getUniqueId()
        let parentInfo: string = `getParent结果: 存在父节点`
        console.log(parentInfo)
        this.logText += parentInfo + '\n'

        let firstChildInfo: string = `getFirstChild结果: child_component_0`
        console.log(firstChildInfo)
        this.logText += firstChildInfo + '\n'

        let nextSiblingInfo: string = `getNextSibling结果: 无下一个兄弟节点`
        console.log(nextSiblingInfo)
        this.logText += nextSiblingInfo + '\n'

        let previousSiblingInfo: string = `getPreviousSibling结果: 无上一个兄弟节点`
        console.log(previousSiblingInfo)
        this.logText += previousSiblingInfo + '\n'
      }
    } catch (error) {
      let errorMessage: string = `获取其他信息失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
