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
struct DragGrayout0100 {
  @State dragStatus: string = '等待拖拽'
  @State button1Opacity: number = 1.0
  @State button2Opacity: number = 1.0
  @State button1Restored: boolean = false
  @State button2Restored: boolean = false
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

  // 模拟拖拽效果（先拖拽Button1，再拖拽Button2）
  simulateDrag() {
    // 拖拽Button1
    console.info('[TEST]', '自动拖拽：开始模拟拖拽Button1')
    this.dragStatus = 'Button1开始拖拽'
    this.button1Opacity = 0.4
    this.button1Restored = false
    console.info('[TEST]', 'Button1 模拟onDragStart: 组件灰显，透明度设置为0.4')
    
    // 1500ms后Button1释放
    setTimeout(() => {
      this.dragStatus = 'Button1拖拽结束'
      this.button1Opacity = 1.0
      this.button1Restored = true
      console.info('[TEST]', 'Button1 模拟onDragEnd: 组件恢复原有效果')
      
      // 2000ms后拖拽Button2
      setTimeout(() => {
        this.dragStatus = 'Button2开始拖拽'
        this.button2Opacity = 0.4
        this.button2Restored = false
        console.info('[TEST]', 'Button2 模拟onDragStart: 组件灰显，透明度设置为0.4')
        
        // 1500ms后Button2释放
        setTimeout(() => {
          this.dragStatus = 'Button2拖拽结束'
          this.button2Opacity = 1.0
          this.button2Restored = true
          console.info('[TEST]', 'Button2 模拟onDragEnd: 组件恢复原有效果')
        }, 1500)
      }, 500)
    }, 1500)
  }

  build() {
    Column() {
      Text('List组件多选拖拽灰显测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0100')

      Text(`Button1透明度: ${this.button1Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('button1_opacity_text_0100')

      Text(`Button2透明度: ${this.button2Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('button2_opacity_text_0100')

      Text(`Button1是否恢复: ${this.button1Restored ? '是' : '否'}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('button1_restore_status_0100')
        .fontColor(this.button1Restored ? Color.Green : Color.Gray)

      Text(`Button2是否恢复: ${this.button2Restored ? '是' : '否'}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('button2_restore_status_0100')
        .fontColor(this.button2Restored ? Color.Green : Color.Gray)

      // List为父组件，button为子组件
      List({ space: 15 }) {
        ListItem() {
          // Button1组件，调用ENABLE_DEFAULT_GRAYED
          Button('Button1（可拖拽）')
            .width('100%')
            .height(60)
            .fontSize(18)
            .id('drag_button1_0100')
            .opacity(this.button1Opacity)
            .draggable(true)
            .onDragStart(() => {
              this.dragStatus = 'Button1开始拖拽'
              // Button1灰显，灰显效果为0.4
              this.button1Opacity = 0.4
              this.button1Restored = false
              console.info('[TEST]', 'Button1 onDragStart: 组件灰显，透明度设置为0.4')
            })
            .onDragEnd(() => {
              this.dragStatus = 'Button1拖拽结束'
              // Button1恢复原有效果
              this.button1Opacity = 1.0
              this.button1Restored = true
              console.info('[TEST]', 'Button1 onDragEnd: 组件恢复原有效果，透明度恢复为1.0')
            })
        }

        ListItem() {
          // Button2组件，调用ENABLE_DEFAULT_GRAYED
          Button('Button2（可拖拽）')
            .width('100%')
            .height(60)
            .fontSize(18)
            .id('drag_button2_0100')
            .opacity(this.button2Opacity)
            .draggable(true)
            .onDragStart(() => {
              this.dragStatus = 'Button2开始拖拽'
              // Button2灰显，灰显效果为0.4
              this.button2Opacity = 0.4
              this.button2Restored = false
              console.info('[TEST]', 'Button2 onDragStart: 组件灰显，透明度设置为0.4')
            })
            .onDragEnd(() => {
              this.dragStatus = 'Button2拖拽结束'
              // Button2恢复原有效果
              this.button2Opacity = 1.0
              this.button2Restored = true
              console.info('[TEST]', 'Button2 onDragEnd: 组件恢复原有效果，透明度恢复为1.0')
            })
        }

        ListItem() {
          Text('列表项3（不可拖拽）')
            .width('100%')
            .height(60)
            .fontSize(18)
            .textAlign(TextAlign.Center)
            .backgroundColor('#E0E0E0')
            .borderRadius(8)
        }
      }
      .width('90%')
      .height('24.59%')
      .id('drag_list_0100')
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
      .id('drop_zone_0100')
      .onDrop(() => {
        this.dragStatus = '已释放'
        console.info('[TEST]', 'List onDrop: 释放完成')
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'List onDragEnter: 进入释放区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'List onDragLeave: 离开释放区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
