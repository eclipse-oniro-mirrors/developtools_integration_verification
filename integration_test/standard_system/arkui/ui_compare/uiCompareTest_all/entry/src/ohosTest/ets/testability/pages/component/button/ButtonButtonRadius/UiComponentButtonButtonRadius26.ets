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
struct UiComponentButtonButtonRadius26 {
  @State text: string = 'SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_RADIUS_0350 Type=Normal未设置borderRadius';
  @State widthShortSize: number = 200;
  @State count: number = 0;
  @State buttonPressed: boolean = false;
  @State logMessage: string = '等待操作...';

  build() {
    Scroll() {
      Column({ space: 3 }) {
        // 标题区域
        Column({ space: 3 }) {
          Row({ space: 2 }) {
            Text('Button圆角测试 - Normal未设置borderRadius')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .backgroundColor('#FF6B35')
              .width('90%')
              .padding(12)
              .borderRadius(8)
              .textAlign(TextAlign.Center)
              .margin({ top: 15 })
          }

          // 测试编号
          Text('测试编号: ' + this.text)
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333')
            .width('90%')
            .margin({ top: 5 })

          // 状态信息
          Row({ space: 5 }) {
            Text('点击次数:')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
            Text(`${this.count}`)
              .fontSize(14)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .fontColor('#2196F3')
            Text('状态:')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 10 })
            Text(this.buttonPressed ? '按下' : '释放')
              .fontSize(12)
              .fontStyle(FontStyle.Italic)
              .fontColor(this.buttonPressed ? '#4CAF50' : '#999')
          }
        }
        .width('95%')
        .padding(8)
        .backgroundColor('#FFF3E0')
        .borderRadius(5)
        .margin({ top: 5 })

        // 测试按钮
        Column({ space: 8 }) {
          Text('测试按钮')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333')

          Button('NORMAL')
            .width(this.widthShortSize)
            .type(ButtonType.Normal)
            .stateEffect(true)
            .id('UiComponentButtonButtonRadius26_01')
            .controlSize(ControlSize.NORMAL)
            .height(100)
            .onClick(() => {
              this.count++;
              this.logMessage = `按钮被点击 ${this.count}次`;
              console.log('onclick success')
            })
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                this.buttonPressed = true;
                this.logMessage = '按钮按下';
              } else if (event.type === TouchType.Up) {
                this.buttonPressed = false;
                this.logMessage = '按钮释放';
              }
            })
            .buttonStyle(ButtonStyleMode.EMPHASIZED)
            .fontSize(20)
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(6)
        .margin({ top: 5 })

        // 配置说明
        Column({ space: 2 }) {
          Text('配置说明')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333')
          Text('Type: Normal')
            .fontSize(11)
            .fontColor('#666')
          Text('controlSize: NORMAL')
            .fontSize(11)
            .fontColor('#666')
          Text('buttonStyle: EMPHASIZED(默认)')
            .fontSize(11)
            .fontColor('#666')
          Text('未设置borderRadius')
            .fontSize(11)
            .fontColor('#666')
        }
        .width('95%')
        .padding(8)
        .backgroundColor('#E3F2FD')
        .borderRadius(5)
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 5 })

        // 预期结果
        Column({ space: 2 }) {
          Text('预期结果')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor('#D32F2F')
          Text('✓ 普通按钮')
            .fontSize(11)
            .fontColor('#333')
          Text('✓ 不带圆角')
            .fontSize(11)
            .fontColor('#333')
          Text('✓ 可以进行按压，按压区域显示正常')
            .fontSize(11)
            .fontColor('#333')
          Text('✓ 属于强调按钮')
            .fontSize(11)
            .fontColor('#333')
        }
        .width('95%')
        .padding(8)
        .backgroundColor('#FFEBEE')
        .borderRadius(5)
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 5 })

        // 操作日志
        Column({ space: 2 }) {
          Text('操作日志')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Medium)
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Center)
            .border({ width: 1 })
            .lineHeight(20)
            .maxLines(2)
            .margin({
              left: 6,
              right: 6,
              top: 10,
              bottom: 10
            })
          Text(this.logMessage)
            .fontSize(11)
            .fontColor('#666')
        }
        .width('95%')
        .padding(8)
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 5, bottom: 10 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

