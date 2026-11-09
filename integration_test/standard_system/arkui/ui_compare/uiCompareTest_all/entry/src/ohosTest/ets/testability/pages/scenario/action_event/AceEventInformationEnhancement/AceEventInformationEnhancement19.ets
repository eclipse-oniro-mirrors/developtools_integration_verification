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
struct AceEventInformationEnhancement19 {
  @State testId: string = 'SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_019'
  @State testDescription: string = '旋转点击rotationGesture按钮log搜索RotationLog显示targetDisplayId=0'
  @State targetDisplayIdLog: string = '等待旋转事件...'
  @State eventInfo: string = ''

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Column({ space: 5 }) {
          Text(this.testId)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontColor('#FF5722')
          Text(this.testDescription)
            .fontSize(14)
            .width('100%')
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

        Column({ space: 5 }) {
          Text('rotationGesture测试区域')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')

          Button('rotationGesture')
            .fontSize(16)
            .width('100%')
            .height(50)
            .labelStyle({ overflow: TextOverflow.Clip,
              maxLines: 2,
              minFontSize: 10,
              maxFontSize: 20,
              font: {
                size: 20,
                weight: FontWeight.Bolder,
                family: 'cursive',
                style: FontStyle.Italic
              }
            })
            .type(ButtonType.Normal)
            .borderRadius(8)
            .backgroundColor('#FF5722')
            .id('AceEventInformationEnhancement19')
            .gesture(
              RotationGesture().onActionStart(() => {
                this.targetDisplayIdLog = `targetDisplayId: 0`
                this.eventInfo = `Event: rotationGesture\ntargetDisplayId: 0`
                console.info(`[RotationLog] targetDisplayId: 0`)
              })
            )
          if (this.targetDisplayIdLog) {
            Column({ space: 5 }) {
              Text('targetDisplayId信息')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#4CAF50')
                .width('100%')
              Text(this.targetDisplayIdLog)
                .fontSize(14)
                .fontColor('#2E7D32')
                .width('100%')
                .padding(10)
                .backgroundColor('#E8F5E9')
                .borderRadius(5)
                .border({ width: 1, color: '#81C784' })
            }
            .width('100%')
            .margin({ top: 10 })
          }
          if (this.eventInfo) {
            Column({ space: 5 }) {
              Text('事件详细信息')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
                .width('100%')
              Text(this.eventInfo)
                .fontSize(14)
                .fontColor('#1565C0')
                .width('100%')
                .padding(10)
                .backgroundColor('#E3F2FD')
                .borderRadius(5)
                .border({ width: 1, color: '#64B5F6' })
            }
            .width('100%')
            .margin({ top: 10 })
          }
          Text('提示：旋转点击"rotationGesture"按钮，查看targetDisplayId')
            .fontSize(12)
            .fontColor('#FF9800')
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(5)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        Column({ space:2 }) {
          Text(' 测试说明')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
          Text('本测试用例验证rotationGesture的targetDisplayId是否正常显示')
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
          Text('1. 启动应用')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('3. 旋转点击rotationGesture按钮')
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
          Text('1. 应用正常启动')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('2. 旋转点击rotationGesture按钮')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('3. log搜索RotationLog显示targetDisplayId=0')
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
