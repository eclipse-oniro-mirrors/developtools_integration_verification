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
struct DragGrayout0360 {
  @State dragStatus: string = '等待拖拽'
  @State parentOpacity: number = 0.2 // 父组件透明度0.2
  @State childAOpacity: number = 0.9 // 子组件A透明度0.9
  @State childBOpacity: number = 0.4 // 子组件B透明度0.4
  @State childAInitialOpacity: number = 0.9 // 子组件A初始透明度
  @State childBInitialOpacity: number = 0.4 // 子组件B初始透明度
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
    // 拖拽子组件A
    console.info('[TEST]', '自动拖拽：开始模拟拖拽子组件A')
    this.dragStatus = '子组件A开始拖拽'
    this.childAOpacity = 0.072 // 0.9*0.2*0.4
    console.info('[TEST]', '子组件A 模拟onDragStart: 透明度为0.072')
    
    // 1500ms后子组件A释放
    setTimeout(() => {
      this.dragStatus = '子组件A释放'
      this.childAOpacity = 0.18 // 0.9*0.2
      console.info('[TEST]', '子组件A 模拟onDragEnd: 透明度还原为0.18')
      
      // 500ms后拖拽子组件B
      setTimeout(() => {
        this.dragStatus = '子组件B开始拖拽'
        this.childBOpacity = 0.144 // 0.9*0.4*0.4
        console.info('[TEST]', '子组件B 模拟onDragStart: 透明度为0.144')
        
        // 1500ms后子组件B释放至可落入区域
        setTimeout(() => {
          this.dragStatus = '子组件B释放至可落入区域'
          this.childBOpacity = 0.36 // 0.9*0.4
          console.info('[TEST]', '子组件B 模拟onDragEnd: 透明度还原为0.36')
        }, 1500)
      }, 500)
    }, 1500)
  }

  build() {
    Column() {
      Text('父子组件复杂透明度拖拽测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0360')

      Text(`父组件透明度: ${this.parentOpacity.toFixed(2)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('parent_opacity_text_0360')

      Text(`子组件A透明度: ${this.childAOpacity.toFixed(3)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('child_a_opacity_text_0360')

      Text(`子组件B透明度: ${this.childBOpacity.toFixed(3)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('child_b_opacity_text_0360')

      // Row为父组件，父组件透明度0.2，父组件调用ENABLE_DEFAULT_GRAYED
      Row() {
        // Image为子组件A，子组件A透明度0.9
        Image($r('app.media.app_icon'))
          .width(100)
          .height(100)
          .id('drag_child_image_a_0360')
          .opacity(this.childAOpacity)
          .draggable(true)
          .onDragStart(() => {
            this.dragStatus = '子组件A开始拖拽'
            // 父组件调用ENABLE_DEFAULT_GRAYED，子组件A透明度为0.9*0.2*0.4=0.072
            this.childAOpacity = 0.072
            console.info('[TEST]', '子组件A onDragStart: 透明度为0.9*0.2*0.4=0.072')
          })
          .onDragEnd(() => {
            this.dragStatus = '子组件A拖拽结束'
            // 子组件A透明度还原为0.9*0.2=0.18
            this.childAOpacity = 0.18
            console.info('[TEST]', '子组件A onDragEnd: 透明度还原为0.9*0.2=0.18')
          })
          .margin(10)

        // Image为子组件B，子组件B透明度0.4
        Image($r('app.media.app_icon'))
          .width(100)
          .height(100)
          .id('drag_child_image_b_0360')
          .opacity(this.childBOpacity)
          .draggable(true)
          .onDragStart(() => {
            this.dragStatus = '子组件B开始拖拽'
            // 父组件调用ENABLE_DEFAULT_GRAYED，子组件B透明度为0.9*0.4*0.4=0.144
            this.childBOpacity = 0.144
            console.info('[TEST]', '子组件B onDragStart: 透明度为0.9*0.4*0.4=0.144')
          })
          .onDragEnd(() => {
            this.dragStatus = '子组件B拖拽结束'
            // 子组件B透明度还原为0.9*0.4=0.36
            this.childBOpacity = 0.36
            console.info('[TEST]', '子组件B onDragEnd: 透明度还原为0.9*0.4=0.36')
          })
          .margin(10)
      }
      .width('48.61%')
      .height('9.84%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .borderRadius(8)
      .id('drag_parent_row_0360')
      .opacity(this.parentOpacity)
      .margin({ bottom: 30 })

      // 可落入区域
      Column() {
        Text('可落入区域')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .width('34.72%')
      .height('12.3%')
      .backgroundColor('#4CAF50')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .id('drop_zone_0360')
      .onDrop(() => {
        this.dragStatus = '已释放至可落入区域'
        console.info('[TEST]', 'onDrop: 释放至可落入区域完成')
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'onDragEnter: 进入可落入区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'onDragLeave: 离开可落入区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
