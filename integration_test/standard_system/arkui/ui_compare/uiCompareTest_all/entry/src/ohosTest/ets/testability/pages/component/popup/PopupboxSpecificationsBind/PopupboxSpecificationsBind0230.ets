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
struct PopupboxSpecificationsBind0230 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State closeStatus: string = '等待操作'

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
      
      Text('关闭状态: ' + this.closeStatus)
        .fontSize(14)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
      
      Button('Close')
        .id('close_button_bind_0230')
        .fontSize(14)
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
        .onClick(() => {
          this.closeStatus = '点击Close按钮'
          this.isShow = false
          this.message = '点击Close关闭，isShow值: ' + this.isShow
        })
    }
    .padding(15)
    .backgroundColor(Color.Black)
    .borderRadius(8)
  }

  build() {
    Column() {
      Text('双向绑定测试页面(气泡内Close按钮)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0230')

      Text('关闭状态: ' + this.closeStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('close_status_bind_0230')

      Button('点击弹出气泡')
        .id('button_bind_0230')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindPopup(this.isShow, {
          builder: this.PopupBuilder,
          placement: Placement.Top,
          onStateChange: (e) => {
            this.isShow = e.isVisible
            this.message = 'isShow值: ' + this.isShow
            if (!e.isVisible) {
              this.closeStatus = '气泡已关闭'
            } else {
              this.closeStatus = '气泡已打开'
            }
          }
        })
        .onClick(() => {
          this.isShow = !this.isShow
          this.message = '点击按钮，isShow值: ' + this.isShow
          if (this.isShow) {
            this.closeStatus = '开始弹出气泡'
          }
        })

      Button('显示isShow状态')
        .id('show_status_bind_0230')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 点击按钮弹出气泡(bindPopup)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 观察isShow值变为true')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 点击气泡内的Close按钮')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察气泡关闭，isShow值变为false')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
