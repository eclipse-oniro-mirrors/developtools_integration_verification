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
struct DragGrayout0420 {
  @State dragStatus: string = '等待拖拽'
  @State button1Opacity: number = 1.0
  @State button2Opacity: number = 1.0
  @State button3Opacity: number = 1.0
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

  // 模拟拖拽效果（依次拖拽三个Button）
  simulateDrag() {
    // 拖拽Button1
    console.info('[TEST]', '自动拖拽：开始模拟拖拽Button1')
    this.dragStatus = 'Button1开始拖拽'
    this.button1Opacity = 1.0 // 不灰显
    console.info('[TEST]', 'Button1 模拟onDragStart: 不灰显')
    
    // 1500ms后Button1释放
    setTimeout(() => {
      this.dragStatus = 'Button1拖拽结束'
      this.button1Opacity = 1.0
      console.info('[TEST]', 'Button1 模拟onDragEnd: 拖拽结束')
      
      // 500ms后拖拽Button2
      setTimeout(() => {
        this.dragStatus = 'Button2开始拖拽'
        this.button2Opacity = 1.0 // 不灰显
        console.info('[TEST]', 'Button2 模拟onDragStart: 不灰显')
        
        // 1500ms后Button2释放
        setTimeout(() => {
          this.dragStatus = 'Button2拖拽结束'
          this.button2Opacity = 1.0
          console.info('[TEST]', 'Button2 模拟onDragEnd: 拖拽结束')
          
          // 500ms后拖拽Button3
          setTimeout(() => {
            this.dragStatus = 'Button3开始拖拽'
            this.button3Opacity = 1.0 // 不灰显
            console.info('[TEST]', 'Button3 模拟onDragStart: 不灰显')
            
            // 1500ms后Button3释放
            setTimeout(() => {
              this.dragStatus = 'Button3拖拽结束'
              this.button3Opacity = 1.0
              console.info('[TEST]', 'Button3 模拟onDragEnd: 拖拽结束')
            }, 1500)
          }, 500)
        }, 1500)
      }, 500)
    }, 1500)
  }

  build() {
    Column() {
      Text('dragController多对象测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0420')

      Text(`Button1透明度: ${this.button1Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('button1_opacity_text_0420')
        .fontColor(this.button1Opacity === 1.0 ? Color.Green : Color.Red)

      Text(`Button2透明度: ${this.button2Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('button2_opacity_text_0420')
        .fontColor(this.button2Opacity === 1.0 ? Color.Green : Color.Red)

      Text(`Button3透明度: ${this.button3Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('button3_opacity_text_0420')
        .fontColor(this.button3Opacity === 1.0 ? Color.Green : Color.Red)

      // Button1组件，调用ENABLE_DEFAULT_GRAYED，使用dragController
      Button('Button1（dragController）')
        .width(200)
        .height(60)
        .fontSize(16)
        .id('drag_button1_0420')
        .opacity(this.button1Opacity)
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = 'Button1开始拖拽'
          // 原组件不灰显，保持透明度为1.0
          this.button1Opacity = 1.0
          console.info('[TEST]', 'Button1 onDragStart: 原组件不灰显，透明度保持为1.0')
        })
        .onDragEnd(() => {
          this.dragStatus = 'Button1拖拽结束'
          this.button1Opacity = 1.0
          console.info('[TEST]', 'Button1 onDragEnd: 拖拽结束')
        })
        .margin({ bottom: 10 })

      // Button2组件，调用ENABLE_DEFAULT_GRAYED，使用dragController
      Button('Button2（dragController）')
        .width(200)
        .height(60)
        .fontSize(16)
        .id('drag_button2_0420')
        .opacity(this.button2Opacity)
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = 'Button2开始拖拽'
          // 原组件不灰显，保持透明度为1.0
          this.button2Opacity = 1.0
          console.info('[TEST]', 'Button2 onDragStart: 原组件不灰显，透明度保持为1.0')
        })
        .onDragEnd(() => {
          this.dragStatus = 'Button2拖拽结束'
          this.button2Opacity = 1.0
          console.info('[TEST]', 'Button2 onDragEnd: 拖拽结束')
        })
        .margin({ bottom: 10 })

      // Button3组件，调用ENABLE_DEFAULT_GRAYED，使用dragController
      Button('Button3（dragController）')
        .width(200)
        .height(60)
        .fontSize(16)
        .id('drag_button3_0420')
        .opacity(this.button3Opacity)
        .draggable(true)
        .onDragStart(() => {
          this.dragStatus = 'Button3开始拖拽'
          // 原组件不灰显，保持透明度为1.0
          this.button3Opacity = 1.0
          console.info('[TEST]', 'Button3 onDragStart: 原组件不灰显，透明度保持为1.0')
        })
        .onDragEnd(() => {
          this.dragStatus = 'Button3拖拽结束'
          this.button3Opacity = 1.0
          console.info('[TEST]', 'Button3 onDragEnd: 拖拽结束')
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
      .id('drop_zone_0420')
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
