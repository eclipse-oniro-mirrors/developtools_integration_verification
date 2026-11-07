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
struct DragGrayout0210 {
  @State dragStatus: string = '等待拖拽'
  @State textAreaOpacity: number = 1.0
  @State isRestored: boolean = false
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
    // 原组件灰显，灰显效果为0.4
    this.textAreaOpacity = 0.4
    this.isRestored = false
    console.info('[TEST]', 'TextArea 模拟onDragStart: 组件灰显，透明度设置为0.4')
    
    // 1500ms后模拟释放
    setTimeout(() => {
      this.dragStatus = '拖拽结束'
      // 组件恢复原有效果
      this.textAreaOpacity = 1.0
      this.isRestored = true
      console.info('[TEST]', 'TextArea 模拟onDragEnd: 组件恢复原有效果，透明度恢复为1.0')
    }, 1500)
  }

  build() {
    Column() {
      Text('TextArea组件拖拽灰显测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0210')

      Text(`TextArea透明度: ${this.textAreaOpacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('textarea_opacity_text_0210')

      Text(`组件是否恢复: ${this.isRestored ? '是' : '否'}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('restore_status_text_0210')
        .fontColor(this.isRestored ? Color.Green : Color.Gray)

      // 可拖拽的TextArea组件，调用ENABLE_DEFAULT_GRAYED
      TextArea({ placeholder: '这是一个可拖拽的TextArea组件' })
        .width(300)
        .height(100)
        .fontSize(16)
        .id('drag_textarea_0210')
        .opacity(this.textAreaOpacity)
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = '开始拖拽'
          // 原组件灰显，灰显效果为0.4
          this.textAreaOpacity = 0.4
          this.isRestored = false
          console.info('[TEST]', 'TextArea onDragStart: 组件灰显，透明度设置为0.4')
        })
        .onDragEnd(() => {
          this.dragStatus = '拖拽结束'
          // 组件恢复原有效果
          this.textAreaOpacity = 1.0
          this.isRestored = true
          console.info('[TEST]', 'TextArea onDragEnd: 组件恢复原有效果，透明度恢复为1.0')
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
      .backgroundColor('#4CAF50')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .id('drop_zone_0210')
      .onDrop(() => {
        this.dragStatus = '已释放'
        console.info('[TEST]', 'TextArea onDrop: 释放完成')
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'TextArea onDragEnter: 进入释放区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'TextArea onDragLeave: 离开释放区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
