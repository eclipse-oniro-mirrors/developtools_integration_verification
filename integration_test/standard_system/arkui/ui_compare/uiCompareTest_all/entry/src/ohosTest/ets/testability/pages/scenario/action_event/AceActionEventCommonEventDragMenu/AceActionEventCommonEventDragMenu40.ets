/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Component
struct DraggableCustomComponent40 {
  build() {
    Column() {
      Text('自定义组件')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
      Text('可拖拽')
        .fontSize(12)
        .fontColor('#FFFFFF')
        .margin({ top: 5 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#9C27B0')
    .borderRadius(10)
  }
}

@Entry
@Component
struct AceActionEventCommonEventDragMenu40 {
  @State testId: string = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0480'
  @State testDescription: string = '自定义组件设置bindContextMenu为isShow模式，preview设置为customBuilder'
  @State dragStatus: string = '等待拖拽操作...'
  @State menuStatus: string = '等待菜单触发...'
  @State statusMsg: string = ''
  @State show: boolean = false

  @Builder
  menuBuider() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .onClick(() => {
          this.menuStatus = '菜单项1被点击'
          console.info('[MenuTest] 菜单项1被点击')
        })
      MenuItem({ content: '菜单项2' })
        .onClick(() => {
          this.menuStatus = '菜单项2被点击'
          console.info('[MenuTest] 菜单项2被点击')
        })
      MenuItem({ content: '菜单项3' })
        .onClick(() => {
          this.menuStatus = '菜单项3被点击'
          console.info('[MenuTest] 菜单项3被点击')
        })
    }
  }

  build() {
    Scroll() {
      Column({ space: 2 }) {
        // 标题区域
        Column() {
          Text(this.testId)
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontColor('#FF5722')
          Text(this.testDescription)
            .fontSize(10)
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .textAlign(TextAlign.Center)
            .fontColor('#666666')
          Text('Level 3')
            .fontSize(12)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontColor('#999999')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .shadow({ radius: 5, color: '#E0E0E0', offsetX: 0, offsetY: 2 })
        .margin({ top: 10 })

        Divider()
          .width('90%')
          .color('#EEEEEE')

        // 测试区域
        Column({ space: 2 }) {
          Text('自定义组件长按菜单+拖拽测试区域')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')

          Text('操作提示')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
          Text('1. 长按自定义组件但未触发菜单时拖拽（短时间长按后拖拽）')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('2. 长按自定义组件至触发菜单后拖拽（长时间长按后拖拽）')
            .fontSize(12)
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .fontColor('#666666')
            .width('100%')
            .padding({ left: 10 })

          // 自定义组件测试区域
          Column() {
            DraggableCustomComponent40()
          }
          .id('AceActionEventCommonEventDragMenu40')
          .draggable(true)
          .bindContextMenu(this.show, this.menuBuider(), {
            preview: this.menuBuider()
          })
            .onDragStart(() => {
              this.dragStatus = '拖拽开始'
              this.statusMsg = `拖拽事件: 开始拖拽\n时间: ${new Date().toLocaleTimeString()}`
              console.info('[DragTest] 拖拽开始')
            })
            .onDragEnd((event: DragEvent) => {
              this.dragStatus = '拖拽结束'
              this.statusMsg = `拖拽事件: 拖拽结束\n时间: ${new Date().toLocaleTimeString()}`
              console.info('[DragTest] 拖拽结束')
            })
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                this.statusMsg = `触摸事件: Down\n时间: ${new Date().toLocaleTimeString()}`
                console.info('[DragTest] Touch Down')
              } else if (event.type === TouchType.Up) {
                this.statusMsg = `触摸事件: Up\n时间: ${new Date().toLocaleTimeString()}`
                console.info('[DragTest] Touch Up')
              }
            })
          if (this.dragStatus) {
            Column({ space: 2 }) {
              Text('拖拽状态')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontStyle(FontStyle.Italic)
                .fontColor('#4CAF50')
                .width('100%')
              Text(this.dragStatus)
                .fontSize(14)
                .fontColor('#2E7D32')
                .fontStyle(FontStyle.Italic)
                .width('100%')
                .padding(10)
                .backgroundColor('#E8F5E9')
                .borderRadius(5)
                .border({ width: 1, color: '#81C784' })
            }
            .width('100%')
            .margin({ top: 10 })
          }
          if (this.menuStatus) {
            Column({ space: 2 }) {
              Text('菜单状态')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontStyle(FontStyle.Italic)
                .fontColor('#FF9800')
                .width('100%')
              Text(this.menuStatus)
                .fontSize(14)
                .fontColor('#F57C00')
                .fontStyle(FontStyle.Italic)
                .width('100%')
                .padding(10)
                .backgroundColor('#FFF3E0')
                .borderRadius(5)
                .border({ width: 1, color: '#FFB74D' })
            }
            .width('100%')
            .margin({ top: 10 })
          }
          if (this.statusMsg) {
            Column({ space: 5 }) {
              Text('事件日志')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontStyle(FontStyle.Italic)
                .fontColor('#2196F3')
                .width('100%')
              Text(this.statusMsg)
                .fontSize(14)
                .fontColor('#1565C0')
                .fontStyle(FontStyle.Italic)
                .width('100%')
                .padding(10)
                .backgroundColor('#E3F2FD')
                .borderRadius(5)
                .border({ width: 1, color: '#64B5F6' })
            }
            .width('100%')
            .margin({ top: 10 })
          }
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        Column({ space: 2 }) {
          Text('测试说明')
            .id('AceActionEventCommonEventDragMenu40_02')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
          Text('本测试用例验证自定义组件设置bindContextMenu为isShow模式，preview设置为customBuilder时的拖拽和菜单功能')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .lineHeight(20)
          Text('测试步骤:')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .margin({ top: 5 })
          Text('1. 打开demo')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('2. 长按至未触发菜单时拖拽')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('3. 长按至触发菜单时拖拽')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

        Column({ space: 2 }) {
          Text('预期结果')
            .fontSize(15)
            .fontStyle(FontStyle.Italic)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')
          Text('2-1. 拖拽成功、跟手图为组件本身')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('3-1. 弹出菜单，拖拽成功、跟手图为组件本身')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
        .margin({ bottom: 20 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}

