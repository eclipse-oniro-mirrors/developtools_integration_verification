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
struct DragGrayout0400 {
  @State dragStatus: string = '等待拖拽'
  @State buttonOpacity: number = 1.0
  @State dragCount: number = 0
  @State autoStarted: boolean = false

  // 页面加载时自动触发拖拽效果
  aboutToAppear() {
    console.info('[TEST]', '页面加载完成，2秒后自动触发拖拽效果')
    setTimeout(() => {
      if (!this.autoStarted) {
        this.autoStarted = true
        this.simulateDrag()
      }
    }, 2000)
  }

  // 模拟连续拖拽15次
  simulateDrag() {
    console.info('[TEST]', '自动拖拽：开始模拟连续拖拽15次')
    this.performDragCycle(1)
  }

  // 执行单次拖拽循环
  performDragCycle(count: number) {
    if (count > 15) {
      console.info('[TEST]', '完成15次拖拽')
      return
    }
    
    this.dragCount = count
    this.dragStatus = `开始第${count}次拖拽`
    this.buttonOpacity = 0.4
    console.info('[TEST]', `第${count}次拖拽: 组件灰显，透明度0.4`)
    
    // 根据不同阶段使用不同速度（快速5次/慢速5次/正常5次）
    let cycleTime = count <= 5 ? 300 : (count <= 10 ? 600 : 450) // 快速/慢速/正常
    
    setTimeout(() => {
      this.dragStatus = `第${count}次拖拽结束`
      this.buttonOpacity = 1.0
      console.info('[TEST]', `第${count}次拖拽结束: 透明度恢复1.0`)
      
      // 继续下一次
      setTimeout(() => {
        this.performDragCycle(count + 1)
      }, 100)
    }, cycleTime)
  }

  build() {
    Column() {
      Text('连续多次拖拽测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0400')

      Text(`Button透明度: ${this.buttonOpacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('button_opacity_text_0400')

      Text(`拖拽次数: ${this.dragCount}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('drag_count_text_0400')
        .fontColor('#2196F3')

      // 可拖拽的Button组件，调用ENABLE_DEFAULT_GRAYED
      Button('拖拽我15次')
        .width(200)
        .height(60)
        .fontSize(18)
        .id('drag_button_0400')
        .opacity(this.buttonOpacity)
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = '开始拖拽'
          this.dragCount++
          // 原组件灰显，灰显效果为0.4
          this.buttonOpacity = 0.4
          console.info('[TEST]', `Button onDragStart: 第${this.dragCount}次拖拽，组件灰显，透明度设置为0.4`)
        })
        .onDragEnd(() => {
          this.dragStatus = '拖拽结束'
          // 组件恢复原有效果
          this.buttonOpacity = 1.0
          console.info('[TEST]', `Button onDragEnd: 第${this.dragCount}次拖拽结束，组件恢复原有效果，透明度恢复为1.0`)
        })
        .margin({ bottom: 30 })

      // 释放区域
      Column() {
        Text('释放区域')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .width('34.72%')
      .height('16.39%')
      .backgroundColor('#4CAF50')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .id('drop_zone_0400')
      .onDrop(() => {
        this.dragStatus = `已释放（第${this.dragCount}次）`
        console.info('[TEST]', `Button onDrop: 第${this.dragCount}次释放完成`)
      })
      .onDragEnter(() => {
        console.info('[TEST]', `Button onDragEnter: 第${this.dragCount}次进入释放区域`)
      })
      .onDragLeave(() => {
        console.info('[TEST]', `Button onDragLeave: 第${this.dragCount}次离开释放区域`)
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
