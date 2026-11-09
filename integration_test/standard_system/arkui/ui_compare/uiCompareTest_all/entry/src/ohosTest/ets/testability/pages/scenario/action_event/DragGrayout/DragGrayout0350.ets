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
struct DragGrayout0350 {
  @State dragStatus: string = '等待拖拽'
  @State componentOpacity: number = 0.4 // 组件自身设置透明度0.4
  @State initialOpacity: number = 0.4 // 记录初始透明度
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

  // 模拟拖拽效果
  simulateDrag() {
    console.info('[TEST]', '自动拖拽：开始模拟拖拽')
    this.dragStatus = '开始拖拽'
    // 不调用ENABLE_DEFAULT_GRAYED，透明度保持为0.4，不叠加
    this.componentOpacity = 0.4
    console.info('[TEST]', 'Button 模拟onDragStart: 不调用灰显，透明度保持为0.4')
    
    // 1500ms后模拟释放
    setTimeout(() => {
      this.dragStatus = '拖拽结束'
      // 组件透明度依然为0.4
      this.componentOpacity = this.initialOpacity
      console.info('[TEST]', 'Button 模拟onDragEnd: 组件透明度依然为0.4')
    }, 1500)
  }

  build() {
    Column() {
      Text('组件自身透明度0.4不调用测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0350')

      Text(`组件透明度: ${this.componentOpacity.toFixed(2)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('component_opacity_text_0350')
        .fontColor(this.componentOpacity === 0.4 ? Color.Green : Color.Red)

      // Button组件，自身设置透明度0.4，不调用ENABLE_DEFAULT_GRAYED
      Button('拖拽我（初始透明度0.4）')
        .width(250)
        .height(60)
        .fontSize(18)
        .id('drag_button_0350')
        .opacity(this.componentOpacity)
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = '开始拖拽'
          // 不调用ENABLE_DEFAULT_GRAYED，透明度保持为0.4，不叠加
          this.componentOpacity = 0.4
          console.info('[TEST]', 'Button onDragStart: 不调用灰显，透明度保持为0.4')
        })
        .onDragEnd(() => {
          this.dragStatus = '拖拽结束'
          // 组件透明度依然为0.4
          this.componentOpacity = this.initialOpacity
          console.info('[TEST]', 'Button onDragEnd: 组件透明度依然为0.4')
        })
        .margin({ bottom: 30 })

      // 释放区域
      Column() {
        Text('释放区域')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .width('34.72%')
      .height('12.3%')
      .backgroundColor('#2196F3')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .id('drop_zone_0350')
      .onDrop(() => {
        this.dragStatus = '已释放'
        console.info('[TEST]', 'Button onDrop: 释放完成')
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'Button onDragEnter: 进入释放区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'Button onDragLeave: 离开释放区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
