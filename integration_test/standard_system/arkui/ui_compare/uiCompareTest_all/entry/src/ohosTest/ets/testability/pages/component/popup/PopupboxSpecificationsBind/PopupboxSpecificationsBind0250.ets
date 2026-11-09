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
struct PopupboxSpecificationsBind0250 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State blankStatus: string = '等待操作'

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .onClick(() => {
          this.message = '菜单项1点击，isShow值: ' + this.isShow
        })
      MenuItem({ content: '菜单项2' })
        .onClick(() => {
          this.message = '菜单项2点击，isShow值: ' + this.isShow
        })
      MenuItem({ content: '菜单项3' })
        .onClick(() => {
          this.message = '菜单项3点击，isShow值: ' + this.isShow
        })
    }
  }

  build() {
    Column() {
      Text('双向绑定测试页面(点击空白退出菜单)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0250')

      Text('空白点击状态: ' + this.blankStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('blank_status_bind_0250')

      Button('长按打开菜单')
        .id('button_bind_0250')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindContextMenu(this.MyMenu, ResponseType.LongPress)

      Button('显示isShow状态')
        .id('show_status_bind_0250')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('模拟点击空白')
        .id('simulate_blank_click_bind_0250')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.isShow) {
            this.blankStatus = '模拟点击空白区域'
            // 模拟点击空白区域关闭菜单
            this.isShow = false
            this.message = '点击空白关闭，isShow值: ' + this.isShow
            this.blankStatus = '空白点击，菜单已关闭'
          } else {
            this.blankStatus = '当前菜单未打开'
          }
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 长按按钮打开菜单(bindContextMenu)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 观察isShow值变为true')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 点击空白区域(或点击模拟点击空白)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察菜单关闭，isShow值变为false')
        .fontSize(12)

      // 添加一个空白区域用于点击
      Row() {
        Text('点击此空白区域可关闭菜单')
          .fontSize(14)
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height('6.56%')
      .backgroundColor(Color.Gray)
      .borderRadius(8)
      .margin({ top: 20 })
      .justifyContent(FlexAlign.Center)
      .id('blank_area_bind_0250')
      .onClick(() => {
        if (this.isShow) {
          this.blankStatus = '点击空白区域'
          this.isShow = false
          this.message = '点击空白关闭菜单，isShow值: ' + this.isShow
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
