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
struct PopupboxSpecificationsBind0180 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State animationStatus: string = '等待操作'
  @State isAnimating: boolean = false

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
      Text('双向绑定测试页面(bindMenu动效打断)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0180')

      Text('动效状态: ' + this.animationStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('animation_status_bind_0180')

      Button('点击打开菜单')
        .id('button_bind_0180')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindMenu(this.MyMenu)

      Button('显示isShow状态')
        .id('show_status_bind_0180')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('人为打断动效')
        .id('interrupt_animation_bind_0180')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.isAnimating) {
            this.animationStatus = '动效被人为打断'
            this.isAnimating = false
            // 打断后执行退出动效
            setTimeout(() => {
              this.isShow = false
              this.message = '打断后，isShow值: ' + this.isShow
              this.animationStatus = '打断后退出动效完成'
            }, 200)
          } else {
            this.animationStatus = '当前无动效可打断'
          }
        })

      Button('模拟点击空白区域')
        .id('click_blank_bind_0180')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.isShow || this.isAnimating) {
            this.animationStatus = '点击空白区域关闭菜单'
            this.isAnimating = false
            // 模拟点击空白区域关闭菜单
            setTimeout(() => {
              this.isShow = false
              this.message = '点击空白关闭，isShow值: ' + this.isShow
              this.animationStatus = '菜单已关闭'
            }, 200)
          }
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 点击按钮开始菜单弹出动效(bindMenu)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 在动效过程中点击"人为打断动效"')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 观察动效被打断后的退出过程')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察isShow值在动效完成后才改变')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
