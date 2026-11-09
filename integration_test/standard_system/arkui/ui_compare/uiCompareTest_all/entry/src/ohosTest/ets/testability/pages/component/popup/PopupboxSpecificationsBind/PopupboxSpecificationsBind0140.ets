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
struct PopupboxSpecificationsBind0140 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State screenStatus: string = '屏幕亮起'

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
      
      Text('屏幕状态: ' + this.screenStatus)
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

  aboutToAppear() {
    // 监听应用生命周期变化
    this.registerLifecycleCallback()
  }

  registerLifecycleCallback() {
    // 这里可以添加生命周期监听逻辑
    // 当设备息屏时，气泡会自动关闭，isShow会变为false
  }

  build() {
    Column() {
      Text('双向绑定测试页面(息屏关闭气泡)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0140')

      Text('屏幕状态: ' + this.screenStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('screen_status_bind_0140')

      Button('点击弹出气泡')
        .id('button_bind_0140')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindPopup(this.isShow, {
          builder: this.PopupBuilder,
          placement: Placement.Top,
          onStateChange: (e) => {
            this.isShow = e.isVisible
            this.message = 'isShow值: ' + this.isShow
            if (!e.isVisible) {
              this.screenStatus = '气泡已关闭'
            }
          }
        })
        .onClick(() => {
          this.isShow = !this.isShow
          this.message = '点击按钮，isShow值: ' + this.isShow
          if (this.isShow) {
            this.screenStatus = '气泡已打开'
          }
        })

      Button('显示isShow状态')
        .id('show_status_bind_0140')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('模拟息屏')
        .id('simulate_screen_off_bind_0140')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          this.screenStatus = '模拟息屏'
          // 模拟息屏时气泡关闭的效果
          if (this.isShow) {
            // 先执行动效，后修改isShow的值
            setTimeout(() => {
              this.isShow = false
              this.message = '息屏后，isShow值: ' + this.isShow
              this.screenStatus = '息屏状态，气泡已关闭'
            }, 300) // 模拟动效时间
          }
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

      Text('3. 息屏(或点击模拟息屏)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察先执行动效，后isShow值变为false')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }

  onPageHide() {
    // 页面隐藏时的处理
    this.screenStatus = '页面已隐藏'
    if (this.isShow) {
      this.isShow = false
      this.message = '页面隐藏，isShow值: ' + this.isShow
    }
  }

  onPageShow() {
    // 页面显示时的处理
    this.screenStatus = '页面已显示'
    this.message = '页面显示，isShow值: ' + this.isShow
  }

  onBackPress() {
    // 返回键处理
    if (this.isShow) {
      this.isShow = false
      this.message = '返回键关闭，isShow值: ' + this.isShow
      return true
    }
    return false
  }
}
