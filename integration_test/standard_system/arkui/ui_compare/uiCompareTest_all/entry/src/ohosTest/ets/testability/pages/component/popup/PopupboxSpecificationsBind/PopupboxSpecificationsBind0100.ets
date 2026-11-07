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
struct PopupboxSpecificationsBind0100 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State backgroundStatus: string = '前台运行'

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

  aboutToAppear() {
    // 监听应用生命周期变化
    this.registerLifecycleCallback()
  }

  registerLifecycleCallback() {
    // 这里可以添加生命周期监听逻辑
    // 当应用切换到后台时，菜单会自动关闭，isShow会变为false
  }

  build() {
    Column() {
      Text('双向绑定测试页面(切后台)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0100')

      Text('应用状态: ' + this.backgroundStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('background_status_bind_0100')

      Button('长按打开菜单')
        .id('button_bind_0100')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindContextMenu(this.MyMenu, ResponseType.LongPress)

      Button('显示isShow状态')
        .id('show_status_bind_0100')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('模拟切后台')
        .id('simulate_background_bind_0100')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          this.backgroundStatus = '模拟切后台'
          // 模拟切后台时菜单关闭的效果
          if (this.isShow) {
            this.isShow = false
            this.message = '切后台，isShow值: ' + this.isShow
            this.backgroundStatus = '后台运行，菜单已关闭'
          }
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 长按按钮打开菜单')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 观察isShow值变为true')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 切换到后台(或点击模拟切后台)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察菜单关闭，isShow值变为false')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }

  onPageHide() {
    // 页面隐藏时的处理
    this.backgroundStatus = '页面已隐藏'
    if (this.isShow) {
      this.isShow = false
      this.message = '页面隐藏，isShow值: ' + this.isShow
    }
  }

  onPageShow() {
    // 页面显示时的处理
    this.backgroundStatus = '页面已显示'
    this.message = '页面显示，isShow值: ' + this.isShow
  }
}
