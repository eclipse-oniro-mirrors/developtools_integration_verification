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
struct PopupboxSpecificationsBind0330 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State timerStatus: string = '等待操作'
  private timer: number = -1

  @Builder
  PopupBuilder() {
    Column() {
      Text('这是一个气泡弹窗')
        .fontSize(16)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
      
      Text('当前isShow值: ' + this.isShow)
        .fontSize(14)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
      
      Text('定时器状态: ' + this.timerStatus)
        .fontSize(14)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
      
      Button('关闭气泡')
        .fontSize(14)
        .onClick(() => {
          this.isShow = false
          this.message = '手动关闭气泡，isShow值: ' + this.isShow
        })
    }
    .padding(15)
    .backgroundColor(Color.Black)
    .borderRadius(8)
  }

  build() {
    Column() {
      Text('非双向绑定测试页面(bindPopup状态变量控制)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0330')

      Text('定时器状态: ' + this.timerStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('timer_status_bind_0330')

      Button('点击弹出气泡(非双向绑定)')
        .id('button_bind_0330')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindPopup(this.isShow, {
          builder: this.PopupBuilder,
          placement: Placement.Top
        })
        .onClick(() => {
          this.isShow = !this.isShow
          this.message = '点击按钮，isShow值: ' + this.isShow
        })

      Button('显示isShow状态')
        .id('show_status_bind_0330')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('手动切换isShow')
        .id('toggle_show_bind_0330')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          this.isShow = !this.isShow
          this.message = '手动切换，isShow值: ' + this.isShow
          this.timerStatus = '手动切换状态'
        })

      Button('开始定时切换')
        .id('start_timer_bind_0330')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.timer !== -1) {
            clearInterval(this.timer)
          }
          this.timerStatus = '定时器已启动'
          this.timer = setInterval(() => {
            this.isShow = !this.isShow
            this.message = '定时切换，isShow值: ' + this.isShow
            this.timerStatus = '定时器运行中，isShow: ' + this.isShow
          }, 2000)
        })

      Button('停止定时切换')
        .id('stop_timer_bind_0330')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.timer !== -1) {
            clearInterval(this.timer)
            this.timer = -1
            this.timerStatus = '定时器已停止'
          }
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 不使用双向绑定语法(无onStateChange)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 通过状态变量isShow控制bindPopup显隐')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 可以手动切换或定时切换isShow值')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察气泡显隐与isShow值的对应关系')
        .fontSize(12)

      // 添加一个状态显示区域
      Row() {
        Text('当前isShow: ' + this.isShow)
          .fontSize(16)
          .fontColor(this.isShow ? Color.Green : Color.Red)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor(Color.Gray)
      .borderRadius(8)
      .margin({ top: 20 })
      .justifyContent(FlexAlign.Center)
      .id('status_display_bind_0330')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }

  aboutToDisappear() {
    if (this.timer !== -1) {
      clearInterval(this.timer)
    }
  }
}
