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
struct DataProgressInterface020 {
  @State dragStatus: string = '等待拖拽'
  @State dropStatus: string = '等待释放'
  @State imageDropped: boolean = false
  @State destUri: string = ''
  @State isTransferring: boolean = false
  @State transferCancelled: boolean = false
  @State cancelMessage: string = ''
  @State progressPercentage: number = 0
  @State showCancelButton: boolean = false
  // 测试参数：跨端场景数据传输过程中触发cancelDataLoading接口
  private targetPath: string = '/data/storage/el2/distributedfiles/dropped_image.png'
  @State autoStarted: boolean = false
  private progressInterval: number = -1
  // 拖拽动画相关
  @State isDragging: boolean = false
  @State dragImageX: number = 0
  @State dragImageY: number = 0
  @State dragImageOpacity: number = 0

  @Builder
  pixelMapBuilder() {
    Image($r('app.media.app_icon'))
      .width(80)
      .height(80)
  }

  // 页面加载时自动触发拖拽
  aboutToAppear() {
    console.info(`[TEST]`, '页面加载完成，2秒后自动触发拖拽')
    setTimeout(() => {
      if (!this.autoStarted) {
        this.autoStarted = true
        this.simulateDrag()
      }
    }, 2000)
  }

  // 模拟数据传输
  simulateDataTransfer() {
    this.isTransferring = true
    this.transferCancelled = false
    this.progressPercentage = 0
    this.showCancelButton = true
    console.info(`[TEST]`, '跨端数据传输开始')
    
    // 模拟进度更新
    this.progressInterval = setInterval(() => {
      if (!this.transferCancelled) {
        this.progressPercentage += 10
        console.info(`[TEST]`, `跨端数据传输进度: ${this.progressPercentage}%`)
        
        if (this.progressPercentage >= 100) {
          clearInterval(this.progressInterval)
          this.isTransferring = false
          this.showCancelButton = false
          this.imageDropped = true
          console.info(`[TEST]`, '跨端数据传输完成')
        }
      }
    }, 500)
  }

  // 取消数据传输（模拟cancelDataLoading接口）
  cancelDataLoading() {
    if (this.isTransferring) {
      clearInterval(this.progressInterval)
      this.transferCancelled = true
      this.isTransferring = false
      this.showCancelButton = false
      this.imageDropped = false
      this.cancelMessage = '跨端数据传输已取消，图片不落入'
      console.info(`[TEST]`, 'cancelDataLoading触发：跨端数据传输已取消')
      console.info(`[TEST]`, '图片不落入可释放区域')
    }
  }

  // 模拟自动拖拽效果（带动画）
  simulateDrag() {
    console.info(`[TEST]`, '自动拖拽：开始模拟拖拽')
    this.dragStatus = '开始拖拽'
    this.imageDropped = false
    this.destUri = ''
    this.isTransferring = false
    this.transferCancelled = false
    this.cancelMessage = ''
    this.progressPercentage = 0
    this.showCancelButton = false
    
    // 显示拖拽图片，初始位置在原图片位置
    this.isDragging = true
    this.dragImageX = 0
    this.dragImageY = 0
    this.dragImageOpacity = 1
    
    // 500ms: 开始移动到释放区域
    setTimeout(() => {
      this.dropStatus = '进入释放区域'
      this.dragImageY = 380 // 移动到释放区域
      console.info(`[TEST]`, '自动拖拽：进入释放区域')
    }, 500)
    
    // 1000ms: 在释放区域移动
    setTimeout(() => {
      this.dropStatus = '在释放区域移动'
      this.dragImageX = 10
      console.info(`[TEST]`, '自动拖拽：在释放区域移动')
    }, 1000)
    
    // 1500ms: 释放图片，开始数据传输
    setTimeout(() => {
      this.dropStatus = '收到释放事件'
      this.destUri = this.targetPath
      console.info(`[TEST]`, `自动拖拽：释放图片，开始跨端数据传输: ${this.targetPath}`)
      
      // 开始数据传输
      this.simulateDataTransfer()
    }, 1500)
    
    // 2000ms: 拖拽结束，隐藏拖拽图片
    setTimeout(() => {
      this.dragStatus = '拖拽结束'
      this.dragImageOpacity = 0
      console.info(`[TEST]`, '自动拖拽：拖拽结束')
    }, 2000)
    
    // 2500ms: 重置拖拽状态
    setTimeout(() => {
      this.isDragging = false
    }, 2500)
    
    // 3000ms: 自动触发取消操作（模拟点击cancel按钮）
    setTimeout(() => {
      if (this.isTransferring) {
        console.info(`[TEST]`, '自动触发：点击cancel按钮，取消跨端数据传输')
        this.cancelDataLoading()
      }
    }, 3000)
  }

  build() {
    Stack() {
      // 主要内容层
      Column() {
        Text('跨端场景数据传输过程中触发cancelDataLoading接口测试')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // 状态显示区域
      Column() {
        Text('场景类型: 跨端')
          .fontSize(16)
          .margin(5)
          .fontColor('#00897B')
        Text(`数据传输状态: ${this.isTransferring ? '传输中' : (this.transferCancelled ? '已取消' : '未开始')}`)
          .fontSize(16)
          .margin(5)
          .fontColor(this.isTransferring ? '#4CAF50' : (this.transferCancelled ? '#F44336' : Color.Gray))
          .fontWeight(FontWeight.Bold)
        Text(`拖拽状态: ${this.dragStatus}`)
          .fontSize(16)
          .margin(5)
        Text(`释放状态: ${this.dropStatus}`)
          .fontSize(16)
          .margin(5)
        Text(`图片是否落入: ${this.imageDropped ? '是' : '否'}`)
          .fontSize(16)
          .margin(5)
          .fontColor(this.imageDropped ? Color.Green : Color.Red)
        Text(`destUri路径: ${this.destUri || '未设置'}`)
          .fontSize(14)
          .margin(5)
          .fontColor(this.destUri ? '#4CAF50' : Color.Gray)
          .maxLines(2)
        
        // 传输进度
        if (this.isTransferring) {
          Text(`传输进度: ${this.progressPercentage}%`)
            .fontSize(14)
            .margin(5)
            .fontColor('#4CAF50')
            .fontWeight(FontWeight.Bold)
        }
        
        // 取消信息
        if (this.cancelMessage) {
          Text(this.cancelMessage)
            .fontSize(14)
            .margin(5)
            .fontColor('#F44336')
            .fontWeight(FontWeight.Bold)
        }
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)
      .margin({ bottom: 20 })

      // Cancel按钮（仅在传输过程中显示）
      if (this.showCancelButton) {
        Button('Cancel (取消传输)')
          .id('cancelButton')
          .width('90%')
          .fontSize(16)
          .backgroundColor('#F44336')
          .margin({ bottom: 10 })
          .onClick(() => {
            console.info(`[TEST]`, '用户点击Cancel按钮')
            this.cancelDataLoading()
          })
      }

      // 自动拖拽按钮
      Button('自动模拟拖拽')
        .id('autoSimulateDrag')
        .width('90%')
        .fontSize(16)
        .backgroundColor('#FF6B35')
        .margin({ bottom: 30 })
        .onClick(() => {
          this.simulateDrag()
        })

      // 可拖拽的图片
      Image($r('app.media.app_icon'))
        .width(100)
        .height(100)
        .id('dragImage')
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = '开始拖拽'
          this.imageDropped = false
          this.destUri = ''
          this.isTransferring = false
          this.transferCancelled = false
          this.cancelMessage = ''
          this.progressPercentage = 0
          this.showCancelButton = false
          console.info(`[TEST]`, 'onDragStart triggered')
        })
        .onDragEnd(() => {
          this.dragStatus = '拖拽结束'
          console.info(`[TEST]`, 'onDragEnd triggered')
        })
        .margin({ bottom: 30 })

      // 可释放区域
      Column() {
        Text('可释放区域')
          .fontSize(18)
          .fontColor(Color.White)
        Text('\n接受拖拽: 是')
          .fontSize(14)
          .fontColor(Color.White)
        Text('\n跨端数据传输:')
          .fontSize(12)
          .fontColor(Color.White)
        Text('支持取消')
          .fontSize(14)
          .fontColor('#B2DFDB')
          .fontWeight(FontWeight.Bold)
        Text('\ncancelDataLoading接口')
          .fontSize(12)
          .fontColor('#B2DFDB')
        Text('\n跨端路径:')
          .fontSize(11)
          .fontColor(Color.White)
        Text(`${this.targetPath}`)
          .fontSize(10)
          .fontColor(Color.White)
          .maxLines(3)
          .textAlign(TextAlign.Center)
          .padding(5)
      }
      .width('36.11%')
      .height('22.95%')
      .id('dropZone')
      .backgroundColor('#00796B')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .padding(10)
      .onDrop((event) => {
        this.dropStatus = '收到释放事件'
        this.destUri = this.targetPath
        console.info(`[TEST]`, `onDrop triggered - 开始跨端数据传输，destUri: ${this.destUri}`)
        
        // 开始数据传输
        this.simulateDataTransfer()
      })
      .onDragEnter((event) => {
        this.dropStatus = '进入释放区域'
        console.info(`[TEST]`, 'onDragEnter triggered')
      })
      .onDragMove((event) => {
        this.dropStatus = '在释放区域移动'
      })
      .onDragLeave((event) => {
        this.dropStatus = '离开释放区域'
        console.info(`[TEST]`, 'onDragLeave triggered')
      })

        Blank()
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.White)

      // 拖拽动画层（覆盖在主内容之上）
      if (this.isDragging) {
        Image($r('app.media.app_icon'))
          .width(80)
          .height(80)
          .position({ x: 180 + this.dragImageX, y: 400 + this.dragImageY })
          .opacity(this.dragImageOpacity)
          .animation({
            duration: 400,
            curve: Curve.EaseInOut
          })
          .shadow({
            radius: 20,
            color: Color.Gray,
            offsetX: 0,
            offsetY: 5
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}



