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

import { promptAction } from '@kit.ArkUI';

@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Text('自定义弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('这是一个不设置描边属性的CustomDialog\n\n请观察：\n1. 双描边是否不生效\n2. 圆角大小是否为32.0vp/24.0vp')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 30 })

      Row() {
        Button('取消')
          .fontSize(16)
          .fontColor('#2196F3')
          .backgroundColor(Color.Transparent)
          .width('45%')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })

        Divider()
          .vertical(true)
          .height(40)
          .color('#E0E0E0')

        Button('确认')
          .fontSize(16)
          .fontColor('#2196F3')
          .backgroundColor(Color.Transparent)
          .width('45%')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: 10 })
    }
    .width('100%')
    .padding({ left: 20, right: 20 })
  }
}

@Entry
@Component
struct PopupboxDoubleStroke0050 {
  @State testStatus: string = '点击按钮开始测试';
  @State testResult: string = '';
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: () => {
        this.testStatus = '测试取消';
        this.testResult = '测试已取消';
        console.info('[PopupboxDoubleStroke0050] 用户取消了CustomDialog');
      },
      confirm: () => {
        this.testStatus = '测试完成';
        this.testResult = '✓ 已显示CustomDialog，请确认双描边和圆角符合预期';
        console.info('[PopupboxDoubleStroke0050] CustomDialog已关闭');
      }
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  })

  // 显示不设置描边属性的CustomDialog
  showCustomDialogWithoutBorder() {
    this.dialogController.open()
    this.testStatus = '正在显示CustomDialog';
    console.info('[PopupboxDoubleStroke0050] 显示不设置描边属性的CustomDialog');
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('CustomDialog双描边测试')
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

            Text('本测试用例验证CustomDialog不设置描边属性时的双描边和圆角情况')
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

              Text('1. 页面中创建CustomDialog')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. CustomDialog不设置描边属性')
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

              Text('✓ 双描边不生效')
                .fontSize(12)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('✓ 圆角大小为32.0vp/24.0vp')
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
              Text('步骤1: 点击自定义弹窗，进入测试页面')
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

              Button('点击显示不设置描边属性的CustomDialog')
                .id('button_show_custom_dialog')
                .fontSize(16)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.showCustomDialogWithoutBorder();
                })

              Text('点击按钮后，观察CustomDialog的双描边和圆角显示情况')
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

              Text('• 不设置描边属性时，双描边不应该生效')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• 弹窗边缘应该是单一边框或无明显描边')
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

              Text('• 弹窗的圆角应该为32.0vp/24.0vp')
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

