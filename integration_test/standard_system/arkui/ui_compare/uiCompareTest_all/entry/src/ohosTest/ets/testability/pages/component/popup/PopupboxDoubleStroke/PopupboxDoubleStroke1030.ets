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
struct PopupboxDoubleStroke1030 {
  @State testStatus: string = '点击按钮开始测试';
  @State testResult: string = '';

  // 显示AlertDialog（XYAO设备）
  showAlertDialogOnXYAO() {
    AlertDialog.show({
      title: '警告弹窗 (XYAO设备)',
      message: '这是一个在XYAO设备上显示的AlertDialog\n\n请观察：\n1. 双描边是否生效\n2. 圆角大小是否从32.0vp/24.0vp变为16vp',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: 0 },
      primaryButton: {
        value: '确认',
        action: () => {
          this.testStatus = '测试完成';
          this.testResult = '✓ 已显示AlertDialog，请确认双描边和圆角符合预期';
          console.info('[PopupboxDoubleStroke1030] AlertDialog已关闭');
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
          this.testStatus = '测试取消';
          this.testResult = '测试已取消';
          console.info('[PopupboxDoubleStroke1030] 用户取消了AlertDialog');
        }
      }
    });
    this.testStatus = '正在显示AlertDialog';
    console.info('[PopupboxDoubleStroke1030] 显示AlertDialog（XYAO设备）');
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('XYAO设备Dialog双描边测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 20 }) {
          // 测试说明
          Column() {
            Text('测试说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('本测试用例验证XYAO设备上Dialog的双描边和圆角显示情况')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            Column() {
              Text('预置条件:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. 页面中创建AlertDialog')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. AlertDialog不设置描边属性')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Text('预期结果:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('✓ 双描边生效')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('✓ 圆角大小从32.0vp/24.0vp变为16vp')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ top: 20 })

          // 重要提示
          Column() {
            Text('⚠️ 重要提示')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF9800')
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('本测试用例专门用于XYAO设备，在XYAO设备上：')
              .fontSize(13)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            Column() {
              Text('• 双描边会生效（与ALN设备不同）')
                .fontSize(12)
                .fontColor('#FF5722')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 5 })

              Text('• 圆角大小会从32.0vp/24.0vp变为16vp')
                .fontSize(12)
                .fontColor('#FF5722')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFF3E0')
          .borderRadius(10)
          .border({ width: 2, color: '#FF9800' })

          // 当前状态显示
          Column() {
            Text('测试状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('当前状态: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.testStatus)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
                .layoutWeight(1)
            }
            .width('100%')
            .margin({ bottom: 10 })

            if (this.testResult) {
              Divider()
                .margin({ top: 5, bottom: 10 })

              Text(this.testResult)
                .fontSize(13)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Medium)
            }
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // 测试步骤
          Column() {
            Text('测试步骤')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Column() {
              Text('步骤1: 在可折叠设备上，进入测试页面')
                .fontSize(13)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('✓ 已完成')
                .fontSize(12)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
            .margin({ bottom: 15 })

            Column() {
              Text('步骤2: 点击不设置描边属性按钮')
                .fontSize(13)
                .fontColor('#333333')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 10 })

              Button('点击显示AlertDialog')
                .id('button_show_alert_dialog_xyao')
                .fontSize(16)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.showAlertDialogOnXYAO();
                })

              Text('点击按钮后，观察alertDialog的双描边和圆角显示情况')
                .fontSize(11)
                .fontColor('#999999')
                .margin({ top: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // 观察要点
          Column() {
            Text('观察要点')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Column() {
              Row() {
                Text('1.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('双描边效果')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Text('• 在XYAO设备上，双描边应该生效')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• 弹窗边缘应该有明显的双层描边效果')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Row() {
                Text('2.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('圆角大小')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Text('• 弹窗的圆角应该为16vp（比ALN设备更小）')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• 圆角应该平滑自然，符合UX设计规范')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF9C4')
            .borderRadius(8)

            Column() {
              Row() {
                Text('3.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('设备差异')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Text('• XYAO设备：双描边生效，圆角16vp')
                .fontSize(12)
                .fontColor('#FF5722')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• ALN设备：双描边不生效，圆角32.0vp/24.0vp')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#F3E5F5')
            .borderRadius(8)
            .margin({ top: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ bottom: 30 })
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

