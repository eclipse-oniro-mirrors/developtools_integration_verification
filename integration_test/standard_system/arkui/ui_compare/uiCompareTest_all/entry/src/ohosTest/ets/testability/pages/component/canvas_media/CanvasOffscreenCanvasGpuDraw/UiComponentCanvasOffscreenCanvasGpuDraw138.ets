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
struct UiComponentCanvasOffscreenCanvasGpuDraw138 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State message: string = 'SUB_ACE_UI_COMPONENT_CANVAS_OFFECREENCANVAS-GPU-DRAW_0140'
  @State toDataURL: string = ''
  @State imageFormat: string = '图像格式: image/jpeg'
  @State imageQuality: string = '图片质量: 0.92 (默认)'
  @State urlLength: string = ''
  @State renderStatus: string = ''
  @State testDescription: string = '设置画布对象接口toDataURL的type为image/jpeg'

  aboutToAppear() {
    this.renderStatus = '等待Canvas组件初始化...'
  }

  build() {
    Scroll() {
      Column({ space: 2 }) {
        Column({ space: 2 }) {
          Text(this.message)
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
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .shadow(
          { radius: 5,
            color: '#E0E0E0',
            offsetX: 0,
            offsetY: 2 })
        .margin({ top: 10 })

        Divider()
          .width('90%')
          .color('#EEEEEE')

        Column({ space: 2 }) {
          Text('📋 测试说明')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
          Text('本测试用例验证toDataURL()方法设置type为image/jpeg时的行为')
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
          Text('1. 创建画布组件、设置画布对象接口toDataURL的type为image/jpeg')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('2. 编译运行hap包')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('3. 查看打印log和图像格式')
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
          Text('🎨 Canvas渲染区域')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')
          Canvas(this.context)
            .width('100%')
            .height(150)
            .backgroundColor('#FFFFFF')
            .border({ width: 2, color: '#CCCCCC' })
            .borderRadius(8)
            .onReady(() => {
              this.context.fillStyle = '#00ff00'
              this.context.fillRect(0, 0, 100, 100)
              this.toDataURL = this.context.toDataURL('image/jpeg')
              this.urlLength = `URL长度: ${this.toDataURL.length} 字符`
              this.renderStatus = 'Canvas渲染完成,toDataURL()调用成功'
              console.info('toDataURL:', this.toDataURL.substring(0, 50))
            })
            .id('UiComponentCanvasOffscreenCanvasGpuDraw138_canvas')
          Text(this.renderStatus)
            .fontSize(12)
            .fontColor('#FF9800')
            .width('100%')
            .padding(8)
            .backgroundColor('#FFF3E0')
            .borderRadius(5)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        if (this.toDataURL) {
          Column({ space: 5 }) {
            Text('生成的URL地址')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
              .fontColor('#607d7B')
              .width('100%')
            Text(`${this.toDataURL.substring(0, 50)}...`)
              .fontSize(11)
              .fontColor('#333333')
              .width('100%')
              .padding(10)
              .backgroundColor('#ECEFF1')
              .borderRadius(5)
              .wordBreak(WordBreak.BREAK_ALL)
              .border({ width: 1, color: '#B0BEC5' })
            Text('注意: 仅显示前50个字符,完整URL已输出到控制台')
              .fontSize(10)
              .fontColor('#999999')
              .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
        }

        Column({ space: 8 }) {
          Text('预期结果')
            .fontSize(15)
            .fontStyle(FontStyle.Italic)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')
          Text('1. 图像格式为image/jpeg')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('2. 图片的URL地址能够打印出来')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .fontSize(13)
            .fontColor('#333333')
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
    .backgroundColor('#FAFAFA')
  }
}
