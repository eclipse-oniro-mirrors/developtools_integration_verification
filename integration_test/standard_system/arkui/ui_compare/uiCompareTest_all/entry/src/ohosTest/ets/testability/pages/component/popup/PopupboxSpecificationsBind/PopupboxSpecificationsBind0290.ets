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
struct PopupboxSpecificationsBind0290 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State dragStatus: string = '等待操作'

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
      Text('双向绑定测试页面(previewMode拖拽预览图)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0290')

      Text('拖拽状态: ' + this.dragStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('drag_status_bind_0290')

      Button('长按预览图打开菜单')
        .id('button_bind_0290')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindContextMenu(this.MyMenu, ResponseType.LongPress)
        .onDragStart(() => {
          this.dragStatus = '开始拖拽预览图'
          this.message = '拖拽开始，isShow值: ' + this.isShow
        })
        .onDragEnd(() => {
          this.dragStatus = '结束拖拽预览图'
          this.message = '拖拽结束，isShow值: ' + this.isShow
        })

      Button('显示isShow状态')
        .id('show_status_bind_0290')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Button('模拟拖拽预览图')
        .id('simulate_drag_bind_0290')
        .fontSize(16)
        .margin({ top: 10 })
        .onClick(() => {
          if (this.isShow) {
            this.dragStatus = '模拟拖拽预览图'
            // 模拟拖拽预览图时菜单关闭
            this.isShow = false
            this.message = '拖拽预览图，isShow值: ' + this.isShow
            this.dragStatus = '拖拽时菜单关闭'
          } else {
            this.dragStatus = '当前菜单未打开'
          }
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 长按按钮打开菜单(bindContextMenu)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 设置previewMode为IMAGE')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 观察isShow值变为true')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 拖拽预览图(或点击模拟拖拽)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('5. 观察拖拽时isShow值变为false')
        .fontSize(12)

      // 添加一个预览图区域
      Row() {
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .borderRadius(8)
          .id('preview_image_bind_0290')
      }
      .width('100%')
      .height('9.84%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20 })
      .backgroundColor(Color.Gray)
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
