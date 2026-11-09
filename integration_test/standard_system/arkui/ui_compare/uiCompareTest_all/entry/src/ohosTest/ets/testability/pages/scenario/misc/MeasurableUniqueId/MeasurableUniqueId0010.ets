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

class LogCallback {
  callback: (log: string) => void

  constructor(callback: (log: string) => void) {
    this.callback = callback
  }

  call(log: string): void {
    this.callback(log)
  }
}

@Entry
@Component
struct MeasurableUniqueId0010 {
  @State logText: string = '日志输出:\n'

  build() {
    Column() {
      Text('MeasurableUniqueId测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 测试组件
      Column() {
        Text('子组件1')
          .fontSize(16)
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .padding(10)

        Text('子组件2')
          .fontSize(16)
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .padding(10)

        Text('子组件3')
          .fontSize(16)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .padding(10)
      }
      .id('custom_layout')
      .width('100%')
      .height('16.39%')
      .backgroundColor(Color.Gray)
      .margin({ bottom: 20 })
      .justifyContent(FlexAlign.SpaceEvenly)
      .onAreaChange((oldValue: Area, newValue: Area) => {
        let logMessage: string = `onAreaChange - 组件区域变化，新区域: width=${newValue.width}, height=${newValue.height}`
        console.log(logMessage)
        this.logText += logMessage + '\n'
      })
      .onAppear(() => {
        let logMessage: string = `测试组件已出现，开始测试 uniqueId 相关功能`
        console.log(logMessage)
        this.logText += logMessage + '\n'
        
        setTimeout(() => {
          let simulatedUniqueId: number = Math.floor(Math.random() * 10000)
          let measurableLogMessage: string = `模拟 Measurable uniqueId: ${simulatedUniqueId}`
          console.log(measurableLogMessage)
          this.logText += measurableLogMessage + '\n'
          
          let layoutableLogMessage: string = `模拟 Layoutable uniqueId: ${simulatedUniqueId}`
          console.log(layoutableLogMessage)
          this.logText += layoutableLogMessage + '\n'
        }, 500)
      })

      Button('获取FrameNode UniqueId')
        .id('get_uniqueid_button')
        .onClick(() => {
          this.getFrameNodeUniqueId()
        })
        .margin({ bottom: 20 })

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
    .backgroundColor(Color.Grey)
  }

  getFrameNodeUniqueId(): void {
    // 获取FrameNode的uniqueId
    try {
      let frameNode = this.getUIContext()?.getFrameNodeById('custom_layout')
      if (frameNode) {
        let uniqueId: number = frameNode.getUniqueId()
        let logMessage: string = `FrameNode UniqueId: ${uniqueId}`
        console.log(logMessage)
        this.logText += logMessage + '\n'
      }
    } catch (error) {
      let errorMessage: string = `获取FrameNode UniqueId失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
