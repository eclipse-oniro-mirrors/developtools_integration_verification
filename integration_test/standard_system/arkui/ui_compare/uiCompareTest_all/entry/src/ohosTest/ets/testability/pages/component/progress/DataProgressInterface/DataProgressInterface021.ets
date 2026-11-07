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
struct DataProgressInterface021 {
  @State dragStatus: string = '未开始拖拽'
  @State isTransferring: boolean = false
  @State errorMessage: string = ''
  // 测试参数：本端场景非数据传输过程中触发cancelDataLoading接口
  private targetPath: string = '/data/storage/el2/base/files/dropped_image.png'
  @State autoStarted: boolean = false

  // 页面加载时自动触发取消操作
  aboutToAppear() {
    console.info(`[TEST]`, '页面加载完成，2秒后自动触发cancelDataLoading')
    setTimeout(() => {
      if (!this.autoStarted) {
        this.autoStarted = true
        console.info(`[TEST]`, '自动触发：点击cancel按钮（非传输过程）')
        this.cancelDataLoading()
      }
    }, 2000)
  }

  // 尝试取消数据传输（模拟cancelDataLoading接口）
  cancelDataLoading() {
    if (!this.isTransferring) {
      // 非数据传输过程中调用cancelDataLoading，抛出错误
      this.errorMessage = 'Error: 当前没有正在进行的数据传输，无法取消'
      console.error(`[TEST]`, 'cancelDataLoading触发失败：非数据传输过程中调用')
      console.error(`[TEST]`, this.errorMessage)
    } else {
      console.info(`[TEST]`, 'cancelDataLoading触发：数据传输已取消')
    }
  }

  build() {
    Column() {
      Text('本端场景非数据传输过程中触发cancelDataLoading接口测试')
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 状态显示区域
      Column() {
        Text('场景类型: 本端')
          .fontSize(16)
          .margin(5)
          .fontColor('#2196F3')
        Text(`数据传输状态: ${this.isTransferring ? '传输中' : '未传输'}`)
          .fontSize(16)
          .margin(5)
          .fontColor(this.isTransferring ? '#4CAF50' : Color.Gray)
          .fontWeight(FontWeight.Bold)
        Text(`拖拽状态: ${this.dragStatus}`)
          .fontSize(16)
          .margin(5)
        Text('测试场景: 非传输过程中调用cancel')
          .fontSize(16)
          .margin(5)
          .fontColor('#F57C00')
          .fontWeight(FontWeight.Bold)
        Text(`本端路径: ${this.targetPath}`)
          .fontSize(14)
          .margin(5)
          .fontColor(Color.Gray)
          .maxLines(2)
        
        // 错误信息
        if (this.errorMessage) {
          Text(this.errorMessage)
            .fontSize(14)
            .margin(10)
            .padding(10)
            .fontColor('#D32F2F')
            .fontWeight(FontWeight.Bold)
            .backgroundColor('#FFEBEE')
            .borderRadius(5)
            .width('100%')
        }
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)
      .margin({ bottom: 20 })

      // Cancel按钮（一直显示，用于测试非传输过程中调用）
      Button('Cancel (取消传输)')
        .id('cancelButton')
        .width('90%')
        .fontSize(16)
        .backgroundColor('#F44336')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info(`[TEST]`, '用户点击Cancel按钮（非传输过程）')
          this.cancelDataLoading()
        })

      // 说明文字
      Column() {
        Text('测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
        Text('1. 当前没有进行数据传输')
          .fontSize(14)
          .margin(5)
        Text('2. 点击Cancel按钮')
          .fontSize(14)
          .margin(5)
        Text('3. 应该抛出错误')
          .fontSize(14)
          .margin(5)
          .fontColor('#D32F2F')
          .fontWeight(FontWeight.Bold)
      }
      .width('90%')
      .padding(15)
      .backgroundColor('#FFF3E0')
      .borderRadius(8)
      .margin({ top: 20 })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}



