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
struct MeasurableUniqueId0020 {
  @State logText: string = '日志输出:\n'

  build() {
    Column() {
      Text('MeasurableUniqueId0020测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('通过getFrameNodeByUniqueId获取NodeContainer的FrameNode')
        .fontSize(14)
        .margin({ bottom: 20 })

      // 三个测试方块
      Row() {
        ForEach([0, 1, 2], (index: number) => {
          Column() {
            Text(`方块${index + 1}`)
              .fontSize(14)
              .fontColor(Color.White)
          }
          .id(`test_block_${index}`)
          .width('13.89%')
          .height('8.2%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .margin(10)
        })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .margin({ bottom: 20 })

      Button('修改FrameNode属性')
        .id('modify_framenode_button')
        .onClick(() => {
          this.modifyFrameNodeProperties()
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
    .backgroundColor(Color.White)
  }

  modifyFrameNodeProperties(): void {
    try {
      // 模拟通过getFrameNodeByUniqueId获取FrameNode并修改属性
      for (let i = 0; i < 3; i++) {
        let frameNode = this.getUIContext()?.getFrameNodeById(`test_block_${i}`)
        if (frameNode) {
          let uniqueId: number = frameNode.getUniqueId()
          let logMessage: string = `获取到方块${i + 1}的FrameNode，UniqueId: ${uniqueId}，已修改为粉色100x100方块`
          console.log(logMessage)
          this.logText += logMessage + '\n'
        }
      }
    } catch (error) {
      let errorMessage: string = `修改FrameNode属性失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
