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

import prompt from '@system.prompt';

@Entry
@Component
struct PopupboxDoubleStroke0090 {
  @State testStatus: string = '点击按钮开始测试';
  @State testResult: string = '';

  // 显示showActionMenu
  showActionMenuDialog() {
    prompt.showActionMenu({
      title: '操作菜单',
      buttons: [
        {
          text: '选项1',
          color: '#2196F3'
        },
        {
          text: '选项2',
          color: '#4CAF50'
        },
        {
          text: '选项3',
          color: '#FF9800'
        },
        {
          text: '取消',
          color: '#F44336'
        }
      ],
      success: (tapIndex: number) => {
        this.testStatus = '测试完成';
        this.testResult = `✓ 已显示showActionMenu，用户选择了选项${tapIndex + 1}`;
        console.info('[PopupboxDoubleStroke0090] showActionMenu选择了: ' + tapIndex);
      },
      fail: (errMsg: string) => {
        this.testStatus = '测试取消';
        this.testResult = '用户取消了操作菜单';
        console.info('[PopupboxDoubleStroke0090] showActionMenu取消: ' + errMsg);
      }
    });
    this.testStatus = '正在显示showActionMenu';
    console.info('[PopupboxDoubleStroke0090] 显示showActionMenu');
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('showActionMenu双描边测试')
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

            Text('本测试用例验证showActionMenu的双描边和圆角情况')
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

              Text('1. 页面中调用showActionMenu')
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
              Text('步骤1: 点击prompt，点击showActionMenu进入测试页面')
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
              Text('步骤2: 点击showDialog按钮')
                .fontSize(13)
                .fontColor('#333333')
                .fontWeight(FontWeight.Medium)
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 10 })

              Button('点击显示showActionMenu')
                .id('button_show_action_menu')
                .fontSize(16)
                .backgroundColor('#2196F3')
                .fontColor('#FFFFFF')
                .width('100%')
                .height(48)
                .onClick(() => {
                  this.showActionMenuDialog();
                })

              Text('点击按钮后，观察操作菜单的双描边和圆角显示情况')
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

              Text('• 操作菜单的双描边不应该生效')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• 菜单边缘应该是单一边框或无明显描边')
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

              Text('• 操作菜单的圆角应该为32.0vp/24.0vp')
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
                Text('菜单选项')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 5 })

              Text('• 菜单包含4个选项：选项1、选项2、选项3、取消')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 20, bottom: 3 })

              Text('• 每个选项都有不同的颜色标识')
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

