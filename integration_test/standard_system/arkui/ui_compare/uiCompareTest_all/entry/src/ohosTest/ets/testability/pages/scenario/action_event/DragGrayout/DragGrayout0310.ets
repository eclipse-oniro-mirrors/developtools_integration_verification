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
struct DragGrayout0310 {
  @State dragStatus: string = '等待拖拽'
  @State parentOpacity: number = 1.0
  @State childAOpacity: number = 1.0
  @State childBOpacity: number = 1.0
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

  // 模拟拖拽效果（先拖拽子组件A，再拖拽子组件B，最后拖拽父组件）
  simulateDrag() {
    // 拖拽子组件A
    console.info('[TEST]', '自动拖拽：开始模拟拖拽子组件A')
    this.dragStatus = '子组件A开始拖拽'
    this.childAOpacity = 0.4 // 子组件A调用，灰显
    console.info('[TEST]', '子组件A 模拟onDragStart: 组件灰显，透明度设置为0.4')
    
    // 1500ms后子组件A释放
    setTimeout(() => {
      this.dragStatus = '子组件A拖拽结束'
      this.childAOpacity = 1.0
      console.info('[TEST]', '子组件A 模拟onDragEnd: 组件恢复原有效果')
      
      // 500ms后拖拽子组件B
      setTimeout(() => {
        this.dragStatus = '子组件B开始拖拽'
        this.childBOpacity = 1.0 // 子组件B不调用，不灰显
        console.info('[TEST]', '子组件B 模拟onDragStart: 不灰显，透明度保持为1.0')
        
        // 1500ms后子组件B释放
        setTimeout(() => {
          this.dragStatus = '子组件B拖拽结束'
          this.childBOpacity = 1.0
          console.info('[TEST]', '子组件B 模拟onDragEnd: 拖拽结束')
          
          // 500ms后拖拽父组件
          setTimeout(() => {
            this.dragStatus = '父组件开始拖拽'
            this.parentOpacity = 0.4
            this.childAOpacity = 0.4
            this.childBOpacity = 0.4
            console.info('[TEST]', '父组件 模拟onDragStart: 父、子组件均灰显')
            
            // 1500ms后父组件释放
            setTimeout(() => {
              this.dragStatus = '父组件拖拽结束'
              this.parentOpacity = 1.0
              this.childAOpacity = 1.0
              this.childBOpacity = 1.0
              console.info('[TEST]', '父组件 模拟onDragEnd: 组件恢复原有效果')
            }, 1500)
          }, 500)
        }, 1500)
      }, 500)
    }, 1500)
  }

  build() {
    Column() {
      Text('父子组件拖拽灰显测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0310')

      Text(`父组件透明度: ${this.parentOpacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('parent_opacity_text_0310')

      Text(`子组件A透明度: ${this.childAOpacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('child_a_opacity_text_0310')

      Text(`子组件B透明度: ${this.childBOpacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('child_b_opacity_text_0310')

      // Row为父组件，父组件调用ENABLE_DEFAULT_GRAYED
      Row() {
        // Image为子组件A，子组件A调用ENABLE_DEFAULT_GRAYED
        Image($r('app.media.app_icon'))
          .width(100)
          .height(100)
          .id('drag_child_image_a_0310')
          .opacity(this.childAOpacity)
          .draggable(true)
          .onDragStart(() => {
            this.dragStatus = '子组件A开始拖拽'
            // 子组件A调用ENABLE_DEFAULT_GRAYED，灰显效果为0.4
            this.childAOpacity = 0.4
            console.info('[TEST]', '子组件A onDragStart: 组件灰显，透明度设置为0.4')
          })
          .onDragEnd(() => {
            this.dragStatus = '子组件A拖拽结束'
            // 子组件A恢复原有效果
            this.childAOpacity = 1.0
            console.info('[TEST]', '子组件A onDragEnd: 组件恢复原有效果，透明度恢复为1.0')
          })
          .margin(10)

        // Image为子组件B，子组件B不调用ENABLE_DEFAULT_GRAYED
        Image($r('app.media.app_icon'))
          .width(100)
          .height(100)
          .id('drag_child_image_b_0310')
          .opacity(this.childBOpacity)
          .draggable(true)
          .onDragStart(() => {
            this.dragStatus = '子组件B开始拖拽'
            // 子组件B不调用ENABLE_DEFAULT_GRAYED，保持透明度为1.0，不灰显
            this.childBOpacity = 1.0
            console.info('[TEST]', '子组件B onDragStart: 不灰显，透明度保持为1.0')
          })
          .onDragEnd(() => {
            this.dragStatus = '子组件B拖拽结束'
            this.childBOpacity = 1.0
            console.info('[TEST]', '子组件B onDragEnd: 拖拽结束')
          })
          .margin(10)
      }
      .width('48.61%')
      .height('9.84%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .borderRadius(8)
      .id('drag_parent_row_0310')
      .opacity(this.parentOpacity)
      .draggable(true)
      .onDragStart(() => {
        this.dragStatus = '父组件开始拖拽'
        // 父组件调用ENABLE_DEFAULT_GRAYED，父、子组件均灰显，效果为0.4
        this.parentOpacity = 0.4
        this.childAOpacity = 0.4
        this.childBOpacity = 0.4
        console.info('[TEST]', '父组件 onDragStart: 父、子组件均灰显，透明度设置为0.4')
      })
      .onDragEnd(() => {
        this.dragStatus = '父组件拖拽结束'
        // 父、子组件恢复原有效果
        this.parentOpacity = 1.0
        this.childAOpacity = 1.0
        this.childBOpacity = 1.0
        console.info('[TEST]', '父组件 onDragEnd: 父、子组件恢复原有效果，透明度恢复为1.0')
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
      .id('drop_zone_0310')
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
