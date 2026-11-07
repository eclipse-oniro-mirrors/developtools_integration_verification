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
struct DataProgressInterface002 {
  @State dragStatus: string = '等待拖拽'
  @State dropStatus: string = '等待释放'
  @State imageDropped: boolean = false
  // 测试参数：disableDataPrefetch设置为true
  private disableDataPrefetch: boolean = true
  @State autoStarted: boolean = false
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

  // 模拟自动拖拽效果（带动画）
  simulateDrag() {
    console.info(`[TEST]`, '自动拖拽：开始模拟拖拽')
    this.dragStatus = '开始拖拽'
    this.imageDropped = false
    
    // 显示拖拽图片，初始位置在原图片位置
    this.isDragging = true
    this.dragImageX = 0
    this.dragImageY = 0
    this.dragImageOpacity = 1
    
    // 500ms: 开始移动到释放区域
    setTimeout(() => {
      this.dropStatus = '进入释放区域'
      this.dragImageY = 300 // 移动到释放区域
      console.info(`[TEST]`, '自动拖拽：进入释放区域')
    }, 500)
    
    // 1000ms: 在释放区域移动
    setTimeout(() => {
      this.dropStatus = '在释放区域移动'
      this.dragImageX = 10
      console.info(`[TEST]`, '自动拖拽：在释放区域移动')
    }, 1000)
    
    // 1500ms: 释放图片
    setTimeout(() => {
      this.dropStatus = '收到释放事件'
      // 根据 disableDataPrefetch 的值决定是否落入
      if (!this.disableDataPrefetch) {
        this.imageDropped = false
        // 图片不落入，弹回原位
        this.dragImageY = 0
        this.dragImageX = 0
        console.info(`[TEST]`, '自动拖拽：disableDataPrefetch为false，图片不落入，弹回原位')
      } else {
        this.imageDropped = true
        // 图片落入，留在释放区域（保持在释放区域位置）
        console.info(`[TEST]`, '自动拖拽：disableDataPrefetch为true，图片落入')
      }
    }, 1500)
    
    // 2000ms: 拖拽结束，隐藏拖拽图片
    setTimeout(() => {
      this.dragStatus = '拖拽结束'
      this.dragImageOpacity = 0
      console.info(`[TEST]`, '自动拖拽：拖拽结束')
    }, 2000)
    
    // 2500ms: 重置状态
    setTimeout(() => {
      this.isDragging = false
    }, 2500)
  }

  build() {
    Stack() {
      // 主要内容层
      Column() {
        Text('disableDataPrefetch状态true测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // 状态显示区域
      Column() {
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
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)
      .margin({ bottom: 20 })

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
          console.info(`[TEST]`, 'onDragStart triggered')
        })
        .onDragEnd(() => {
          this.dragStatus = '拖拽结束'
          console.info(`[TEST]`, 'onDragEnd triggered')
        })
        .margin({ bottom: 50 })

      // 可释放区域
      Column() {
        Text('可释放区域')
          .fontSize(18)
          .fontColor(Color.White)
        Text(`\n接受拖拽: ${!this.disableDataPrefetch ? '否' : '是'}`)
          .fontSize(14)
          .fontColor(Color.White)
      }
      .width('27.78%')
      .height('16.39%')
      .id('dropZone')
      .backgroundColor(Color.Blue)
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .onDrop((event) => {
        this.dropStatus = '收到释放事件'
        // 根据需求：disableDataPrefetch为true时，图片落入
        if (!this.disableDataPrefetch) {
          this.imageDropped = false
          console.info(`[TEST]`, 'onDrop triggered - disableDataPrefetch is false, image NOT accepted')
        } else {
          this.imageDropped = true
          console.info(`[TEST]`, 'onDrop triggered - disableDataPrefetch is true, image accepted')
        }
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
          .position({ x: 180 + this.dragImageX, y: 350 + this.dragImageY })
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

