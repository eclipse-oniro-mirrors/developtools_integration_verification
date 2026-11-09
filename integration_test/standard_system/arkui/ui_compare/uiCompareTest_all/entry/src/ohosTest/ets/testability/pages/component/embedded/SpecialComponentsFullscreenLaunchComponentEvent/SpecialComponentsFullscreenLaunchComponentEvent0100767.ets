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

import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';

// 全屏模态拖拽测试页面组件
@Component
struct ModalDragPage {
  @State dragText: string = '这是可拖拽的文本内容'
  @State inputValue: string = ''
  @State dragStatus: string = '等待拖拽'

  build() {
    Column() {
      Text('全屏模态拖拽测试页面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('ModalDragPage_001')

      Text('将下方文本拖入输入框')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('ModalDragPage_002')

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('ModalDragPage_003')

      Divider().margin({ bottom: 20 })

      // 可拖拽的文本
      Text(this.dragText)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .padding(20)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)
        .margin({ bottom: 30 })
        .id('ModalDragPage_004')
        .draggable(true)
        .onDragStart((event: DragEvent) => {
          this.dragStatus = '开始拖拽'
          console.info('[ModalDragPage] Drag started')
          
          // 创建统一数据对象
          let unifiedData = new unifiedDataChannel.UnifiedData();
          let plainText = new unifiedDataChannel.PlainText();
          plainText.textContent = this.dragText;
          unifiedData.addRecord(plainText);
          
          // 设置拖拽数据
          event.setData(unifiedData);
          console.info('[ModalDragPage] Drag data set: ' + this.dragText)
        })
        .onDragEnd((event: DragEvent) => {
          this.dragStatus = '拖拽结束'
          console.info('[ModalDragPage] Drag ended, result: ' + event.getResult())
        })

      Text('↓ 拖拽到此处 ↓')
        .fontSize(14)
        .fontColor('#999999')
        .margin({ bottom: 10 })
        .id('ModalDragPage_005')

      // 可接收拖拽的输入框
      TextInput({ text: this.inputValue, placeholder: '请将文本拖入此处' })
        .width('80%')
        .height(60)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('ModalDragPage_006')
        .onChange((value: string) => {
          this.inputValue = value
          console.info('[ModalDragPage] Input value changed: ' + value)
        })
        .onDrop((event: DragEvent) => {
          console.info('[ModalDragPage] Drop event triggered')
          // 获取拖拽数据
          let unifiedData = event.getData();
          if (unifiedData) {
            let records = unifiedData.getRecords();
            console.info('[ModalDragPage] Records count: ' + records.length)
            
            if (records.length > 0) {
              let record = records[0];
              if (record.getType() === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                let plainText = record as unifiedDataChannel.PlainText;
                this.inputValue = plainText.textContent;
                this.dragStatus = '拖拽成功'
                console.info('[ModalDragPage] Drop successful, data: ' + this.inputValue)
              }
            }
          }
        })
        .allowDrop([uniformTypeDescriptor.UniformDataType.PLAIN_TEXT])

      Divider().margin({ top: 20, bottom: 20 })

      Text('输入框当前内容:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('ModalDragPage_007')

      Text(this.inputValue || '(空)')
        .fontSize(14)
        .fontColor(this.inputValue ? '#333333' : '#CCCCCC')
        .padding(15)
        .width('80%')
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .textAlign(TextAlign.Center)
        .id('ModalDragPage_008')

      // 重置按钮
      Button('重置')
        .width('60%')
        .height(45)
        .margin({ top: 30, bottom: 20 })
        .id('ModalDragPage_009')
        .onClick(() => {
          this.inputValue = ''
          this.dragStatus = '等待拖拽'
          console.info('[ModalDragPage] Reset')
        })

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Center)
  }
}

@Entry
@Component
struct SpecialComponentsFullscreenLaunchComponentEvent0100767 {
  @State isShowModal: boolean = false

  // 全屏模态转场样式
  @Builder
  myBuilder() {
    ModalDragPage()
  }

  build() {
    Column() {
      Text('全屏模态拉起原子化服务拖拽事件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_001')

      Text('测试说明: 测试全屏模态中的拖拽功能')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_002')

      // 进入全屏模态拖拽测试按钮
      Button('进入全屏模态拖拽测试')
        .width('80%')
        .height(50)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_003')
        .onClick(() => {
          this.isShowModal = true
          console.info('[FullscreenLaunchDrag] Opening fullscreen modal for drag test')
        })

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_004')

      Text('1. 点击"进入全屏模态拖拽测试"按钮')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_005')

      Text('2. 将可拖拽文本拖入输入框')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_006')

      Divider().margin({ top: 20, bottom: 20 })

      Text('预期结果:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_007')

      Text('• 输入框正常显示拖拽文本')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_008')

      Text('• 拖拽状态显示"拖拽成功"')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('SpecialComponentsFullscreenLaunchComponentEvent0100767_009')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
    .bindContentCover(this.isShowModal, this.myBuilder(), {
      modalTransition: ModalTransition.DEFAULT,
      backgroundColor: Color.White,
      onAppear: () => {
        console.info('[FullscreenLaunchDrag] Modal appeared')
      },
      onDisappear: () => {
        console.info('[FullscreenLaunchDrag] Modal disappeared')
        this.isShowModal = false
      }
    })
  }
}
