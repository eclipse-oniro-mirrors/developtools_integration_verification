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

@Entry
@Component
struct ActionEventCommonEventDragInterface05 {
  @State dragInfo: string = '拖拽测试区域'
  @State dragend: string = '拖拽测试终点'

  build() {
    Column({ space: 30 }) {
      Text('拖拽测试 - onDragMove获取WindowY')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#2196F3')
        .textAlign(TextAlign.Center)
        .margin({ top: 50, bottom: 20 })
        .backgroundColor('#F5F5F5')
        .borderRadius(12)
        .shadow({ radius: 4, color: '#00000020', offsetX: 2, offsetY: 2 })

      Image('/icon.png')
        .width(100)
        .height(100)
        .id('ActionEventCommonEventDragInterface05_01')
        .objectFit(ImageFit.Contain)
        .interpolation(ImageInterpolation.High)
        .padding(20)
        .draggable(true)
        .scale({ x: 1.0, y: 1.0 })
        .rotate({ angle: 0 })
        .opacity(1.0)
        .onDragStart((event) => {
          console.log('开始拖拽 - 坐标:', event.getDisplayX(), event.getDisplayY())
          console.log('拖拽速度:', event.getVelocityX(), event.getVelocityY())
          return {
            extraInfo: JSON.stringify({
              startX: event.getDisplayX(),
              startY: event.getDisplayY(),
              timestamp: Date.now()
            })
          }
        })
        .onDragEnd((event) => {
          console.log('拖拽结束 - 结果:', event.getResult())
          console.log('结束坐标:', event.getDisplayX(), event.getDisplayY())
        })

      Text(this.dragInfo)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FF6F00')
        .textAlign(TextAlign.Center)
        .lineHeight(24)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .padding({ top: 20, bottom: 20, left: 16, right: 16 })
        .backgroundColor('#FFF3E0')
        .borderRadius(12)
        .width('90%')
        .height(120)
        .border({
          width: 3,
          color: '#FF9800',
          style: BorderStyle.Dashed
        })
        .shadow({ radius: 6, color: '#FF980040', offsetX: 3, offsetY: 3 })
        .animation({ duration: 300, curve: Curve.EaseInOut })
        .onDragEnter((event) => {
          console.log(`拖拽进入 - WindowX: ${event.getWindowX()}, WindowY: ${event.getWindowY()}`)
          console.log(`拖拽进入 - 速度X: ${event.getVelocityX()}, 速度Y: ${event.getVelocityY()}`)
        })
        .onDragMove((event) => {
          console.log(`拖拽移动 - WindowY: ${event.getWindowY()}, WindowX: ${event.getWindowX()}`)
          console.log(`拖拽移动 - DisplayY: ${event.getDisplayY()}, 总速度: ${event.getVelocity()}`)
          this.dragInfo = `拖拽移动中...\nWindowY: ${event.getWindowY()}\n时间: ${new Date().toLocaleTimeString()}`
        })
        .onDragLeave((event) => {
          console.log(`拖拽离开 - WindowY: ${event.getWindowY()}`)
          console.log(`拖拽离开 - 预览区域:`, event.getPreviewRect())
        })
        .onDrop((event) => {
          console.log(`拖拽释放 - WindowY: ${event.getWindowY()}`)
          console.log(`拖拽数据:`, event.getData())
        })

      Text(this.dragend)
        .id('ActionEventCommonEventDragInterface05_02')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#4CAF50')
        .textAlign(TextAlign.Center)
        .lineHeight(28)
        .decoration({ type: TextDecorationType.None })
        .letterSpacing(1)
        .backgroundColor('#E8F5E8')
        .borderRadius(16)
        .border({ width: 2, color: '#4CAF50', style: BorderStyle.Solid })
        .shadow({ radius: 5, color: '#4CAF5030', offsetX: 2, offsetY: 2 })
        .width('80%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 20, bottom: 40, left: 20, right: 20 })
  }
}
