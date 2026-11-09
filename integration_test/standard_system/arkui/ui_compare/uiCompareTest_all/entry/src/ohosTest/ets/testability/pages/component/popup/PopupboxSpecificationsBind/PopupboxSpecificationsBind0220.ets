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
struct PopupboxSpecificationsBind0220 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State orientationStatus: string = '竖屏模式'
  @State isRotating: boolean = false

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
      
      Text('屏幕方向: ' + this.orientationStatus)
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
    // 监听屏幕方向变化
    this.registerOrientationCallback()
  }

  registerOrientationCallback() {
    // 这里可以添加屏幕方向监听逻辑
    // 当屏幕方向改变时，气泡会自动关闭，isShow会变为false
  }

  build() {
    Column() {
      Text('双向绑定测试页面(bindPopup横竖屏切换)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0220')

      Text('屏幕方向: ' + this.orientationStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('orientation_status_bind_0220')

      Button('点击弹出气泡')
        .id('button_bind_0220')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindPopup(this.isShow, {
          builder: this.PopupBuilder,
          placement: Placement.Top,
          onStateChange: (e) => {
            if (!e.isVisible && this.isRotating) {
              // 横竖屏切换时的处理
              this.orientationStatus = '屏幕旋转，气泡退出动效中'
              // 模拟退出动效延迟
              setTimeout(() => {
                this.isShow = e.isVisible
                this.message = '屏幕旋转后，isShow值: ' + this.isShow
                this.orientationStatus = '屏幕旋转完成，气泡已关闭'
                this.isRotating = false
              }, 300)
            } else {
              this.isShow = e.isVisible
              this.message = 'isShow值: ' + this.isShow
              if (!e.isVisible) {
                this.orientationStatus = '气泡已关闭'
              } else {
                this.orientationStatus = '气泡已打开'
              }
            }
          }
        })
        .onClick(() => {
          this.isShow = !this.isShow
          this.message = '点击按钮，isShow值: ' + this.isShow
          if (this.isShow) {
            this.orientationStatus = '开始弹出气泡'
          }
        })

      Button('显示isShow状态')
        .id('show_status_bind_0220')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('模拟横竖屏切换')
        .id('simulate_rotation_bind_0220')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.isShow) {
            this.isRotating = true
            this.orientationStatus = '模拟屏幕旋转'
            // 模拟横竖屏切换时气泡关闭的效果
            setTimeout(() => {
              if (this.isRotating) {
                this.isShow = false
                this.message = '屏幕旋转，isShow值: ' + this.isShow
                this.orientationStatus = '屏幕旋转完成，气泡已关闭'
                this.isRotating = false
              }
            }, 300)
          } else {
            // 切换屏幕方向显示
            this.orientationStatus = this.orientationStatus === '竖屏模式' ? '横屏模式' : '竖屏模式'
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

      Text('3. 横竖屏切换(或点击模拟横竖屏切换)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察先执行退出动效，后isShow值变为false')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }

  onConfigurationUpdate(config: Configuration) {
    // 配置更新时的处理
    if (this.isShow) {
      this.isRotating = true
      this.orientationStatus = '屏幕方向改变'
    }
  }
}
