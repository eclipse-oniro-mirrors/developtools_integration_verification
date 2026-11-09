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
struct PopupboxSpecificationsBind0130 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State gestureStatus: string = '等待操作'

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
      Text('双向绑定测试页面(左滑关闭菜单)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0130')

      Text('手势状态: ' + this.gestureStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('gesture_status_bind_0130')

      Button('点击打开菜单')
        .id('button_bind_0130')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindMenu(this.MyMenu)

      Button('显示isShow状态')
        .id('show_status_bind_0130')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('模拟左滑关闭')
        .id('simulate_swipe_bind_0130')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          this.gestureStatus = '模拟左滑手势'
          // 模拟左滑关闭菜单的效果
          if (this.isShow) {
            this.isShow = false
            this.message = '左滑关闭，isShow值: ' + this.isShow
            this.gestureStatus = '左滑关闭菜单'
          }
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 点击按钮打开菜单(bindMenu)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 观察isShow值变为true')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 左滑关闭菜单(或点击模拟左滑)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察菜单关闭，isShow值变为false')
        .fontSize(12)

      // 添加一个可滑动的区域来模拟左滑手势
      Row() {
        Text('← 在此区域左滑可关闭菜单')
          .fontSize(14)
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height('4.92%')
      .backgroundColor(Color.Gray)
      .borderRadius(8)
      .margin({ top: 20 })
      .justifyContent(FlexAlign.Center)
      .id('swipe_area_bind_0130')
      .gesture(
        PanGesture({ fingers: 1, direction: PanDirection.Left, distance: 50 })
          .onActionStart(() => {
            this.gestureStatus = '开始左滑'
          })
          .onActionUpdate(() => {
            this.gestureStatus = '左滑中...'
          })
          .onActionEnd(() => {
            this.gestureStatus = '左滑结束'
            if (this.isShow) {
              this.isShow = false
              this.message = '左滑关闭菜单，isShow值: ' + this.isShow
            }
          })
      )
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
