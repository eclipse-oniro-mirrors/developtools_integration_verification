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
struct PopupboxDoubleStroke0210 {
  @State testStatus: string = '点击按钮开始测试';
  @State testResult: string = '';
  private uiContext: UIContext = this.getUIContext();

  // 显示UIContext.showToast
  showUIContextToast() {
    this.uiContext.getPromptAction().showToast({
      message: '这是一个Toast提示框 (UIContext)\n请观察双描边和圆角情况',
      duration: 3000,
      bottom: '50%'
    });
    this.testStatus = '正在显示UIContext.showToast';
    this.testResult = '✓ 已显示UIContext.showToast，请观察双描边和圆角（3秒后自动消失）';
    console.info('[PopupboxDoubleStroke0210] 显示UIContext.showToast');
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('UIContext.showToast双描边测试')
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

            Text('本测试用例验证UIContext.showToast的双描边和圆角情况')
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

              Text('1. UIContext中创建ShowToast')
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

              Text('✓ 圆角大小为18.0vp')
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
              Text('步骤1: 点击UIContext，点击UI_ShowToast进入测试页面')
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
              Text('步骤2: 点击show toast按钮')
                .fontSize(13)
                .fontColor('#333333')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 10 })

              Button('Show toast')
                .id('button_show_uicontext_toast')
                .fontSize(16)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.showUIContextToast();
                })

              Text('点击按钮后，观察ShowToast的双描边和圆角显示情况')
                .fontSize(11)
                .fontColor('#999999')
                .margin({ top: 10 })

              Text('提示：Toast会在3秒后自动消失')
                .fontSize(11)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Medium)
                .margin({ top: 5 })
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

              Text('• Toast提示框的双描边不应该生效')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• Toast边缘应该是单一边框或无明显描边')
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

              Text('• Toast的圆角应该为18.0vp')
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
                Text('Toast特性')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Text('• Toast显示在屏幕中间位置')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• Toast会在3秒后自动消失')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• Toast显示时不阻塞用户操作')
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

