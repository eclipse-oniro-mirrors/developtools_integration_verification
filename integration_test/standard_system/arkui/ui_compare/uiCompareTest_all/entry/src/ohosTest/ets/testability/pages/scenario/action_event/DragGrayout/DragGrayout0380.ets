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
struct DragGrayout0380 {
  @State dragStatus: string = '等待拖拽'
  @State parentOpacity: number = 1.0
  @State childOpacity: number = 3.0 // 子组件设置透明度3（超过1会被限制为1）
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

  // 模拟拖拽效果（先拖拽子组件，再拖拽父组件）
  simulateDrag() {
    // 拖拽子组件
    console.info('[TEST]', '自动拖拽：开始模拟拖拽子组件')
    this.dragStatus = '子组件开始拖拽'
    this.childOpacity = 0.4 // 1*0.4=0.4（透明度3被限制为1）
    console.info('[TEST]', '子组件 模拟onDragStart: 透明度为1*0.4=0.4')
    
    // 1500ms后子组件释放
    setTimeout(() => {
      this.dragStatus = '子组件拖拽结束'
      this.childOpacity = 1.0 // 恢复到1.0
      console.info('[TEST]', '子组件 模拟onDragEnd: 透明度恢复为1.0')
      
      // 500ms后拖拽父组件
      setTimeout(() => {
        this.dragStatus = '父组件开始拖拽'
        this.parentOpacity = 0.4 // 1*0.4
        this.childOpacity = 0.4 // 1*0.4
        console.info('[TEST]', '父组件 模拟onDragStart: 父组件透明度0.4')
        
        // 1500ms后父组件释放
        setTimeout(() => {
          this.dragStatus = '父组件拖拽结束'
          this.parentOpacity = 1.0
          this.childOpacity = 1.0
          console.info('[TEST]', '父组件 模拟onDragEnd: 透明度恢复为1.0')
        }, 1500)
      }, 500)
    }, 1500)
  }

  build() {
    Column() {
      Text('子组件透明度3父组件调用测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0380')

      Text(`父组件透明度: ${this.parentOpacity.toFixed(2)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('parent_opacity_text_0380')

      Text(`子组件透明度: ${this.childOpacity.toFixed(2)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('child_opacity_text_0380')

      // Row为父组件，父组件调用ENABLE_DEFAULT_GRAYED
      Row() {
        // Image为子组件，子组件设置透明度3（实际会被限制为1.0）
        Image($r('app.media.app_icon'))
          .width(100)
          .height(100)
          .id('drag_child_image_0380')
          .opacity(this.childOpacity)
          .draggable(true)
          .onDragStart(() => {
            this.dragStatus = '子组件开始拖拽'
            // 子组件的透明度为1*0.4=0.4（透明度3会被限制为1）
            this.childOpacity = 0.4
            console.info('[TEST]', '子组件 onDragStart: 透明度为1*0.4=0.4')
          })
          .onDragEnd(() => {
            this.dragStatus = '子组件拖拽结束'
            // 子组件恢复到1.0（透明度3会被限制为1）
            this.childOpacity = 1.0
            console.info('[TEST]', '子组件 onDragEnd: 透明度恢复为1.0')
          })
          .margin(10)
      }
      .width('34.72%')
      .height('9.84%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .borderRadius(8)
      .id('drag_parent_row_0380')
      .opacity(this.parentOpacity)
      .draggable(true)
      .onDragStart(() => {
        this.dragStatus = '父组件开始拖拽'
        // 父组件调用ENABLE_DEFAULT_GRAYED，父组件的透明度为1*0.4=0.4
        this.parentOpacity = 0.4
        this.childOpacity = 0.4
        console.info('[TEST]', '父组件 onDragStart: 父组件透明度为1*0.4=0.4')
      })
      .onDragEnd(() => {
        this.dragStatus = '父组件拖拽结束'
        // 父组件恢复到1.0
        this.parentOpacity = 1.0
        this.childOpacity = 1.0
        console.info('[TEST]', '父组件 onDragEnd: 父组件透明度恢复为1.0')
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
      .id('drop_zone_0380')
      .onDrop(() => {
        this.dragStatus = '已释放'
        console.info('[TEST]', 'onDrop: 释放完成')
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'onDragEnter: 进入释放区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'onDragLeave: 离开释放区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
